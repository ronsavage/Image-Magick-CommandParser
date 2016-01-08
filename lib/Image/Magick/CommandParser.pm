package Image::Magick::CommandParser;

use strict;
use utf8;
use warnings;
use warnings  qw(FATAL utf8);    # Fatalize encoding glitches.

use Data::Dumper::Concise; # For Dumper();
use Data::Section::Simple 'get_data_section';

use Image::Magick::CommandParser::Actions;

use Log::Handler;

use Marpa::R2;

use Moo;

use Set::Array;

use Types::Standard qw/Any HashRef Str/;

has command =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Str,
	required => 0,
);

has grammar =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Any, # 'Marpa::R2::Scanless::G'.
	required => 0,
);

has items =>
(
	default  => sub{return undef},
	is       => 'rw',
	isa      => Any,
	required => 0,
);

has logger =>
(
	default  => sub{return undef},
	is       => 'rw',
	isa      => Any,
	required => 0,
);

has maxlevel =>
(
	default  => sub{return 'notice'},
	is       => 'rw',
	isa      => Str,
	required => 0,
);

has minlevel =>
(
	default  => sub{return 'error'},
	is       => 'rw',
	isa      => Str,
	required => 0,
);

has recce =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Any, # 'Marpa::R2::Scanless::R'.
	required => 0,
);

has result =>
(
	default  => sub{return {} },
	is       => 'rw',
	isa      => HashRef,
	required => 0,
);

our $VERSION = '1.00';

# -----------------------------------------------

sub BUILD
{
	my($self) = @_;

	$self -> grammar
	(
		Marpa::R2::Scanless::G -> new({source => \get_data_section('image.magick.bnf')})
	);

} # End of BUILD.

# --------------------------------------------------

sub _init
{
	my($self, %options) = @_;

	# Reset whatever so the object can be re-used.

	$self -> items(Set::Array -> new);
	$self -> recce
	(
		Marpa::R2::Scanless::R -> new
		({
			grammar           => $self -> grammar,
			semantics_package => 'Image::Magick::CommandParser::Actions',
		})
	);

	# Allow run(command => '...', minlevel => '...', maxlevel => '...').

	$self -> logger(Log::Handler -> new);
	$self -> logger -> add
	(
		screen =>
		{
			maxlevel       => $options{maxlevel} ? $options{maxlevel} : $self -> maxlevel,
			message_layout => '%m',
			minlevel       => $options{minlevel} ? $options{minlevel} : $self -> minlevel,
			utf8           => 1,
		}
	);

	# Strip off any output file name.

	my($command)			= $options{command} ? $options{command} : $self -> command;
	$command				=~ s/^\s+//;
	$command				=~ s/\s+$//;
	my($output_file_name)	= '';
	my($image_regexp)		= '^.+\s+(.+?\.(?:' . join('|', split/\n/, get_data_section('image.formats') ) . '))$';
	$image_regexp			= qr/$image_regexp/;

	if ($command =~ $image_regexp)
	{
		$output_file_name	= $1;
		$command			= substr($command, 0, - length($output_file_name) - 1);
	}

	$self -> command($command);

	return ($command, $output_file_name);

} # End of _init.

# --------------------------------------------------

sub log
{
	my($self, $level, $s) = @_;
	$level = 'notice' if (! defined $level);
	$s     = ''       if (! defined $s);

	$self -> logger -> $level($s) if ($self -> logger);

} # End of log.

# --------------------------------------------------

sub _populate_result
{
	my($self)	= @_;
	my($result)	=
	{
		command		=> '',
		input_file	=> '',
		output_file	=> '',
		options		=> [],
	};

	my(@options);
	my($params);

	for my $item ($self -> items -> print)
	{
		$params = defined($$item{params}[0]) ? $$item{params}[0] : '';

		if ($$item{rule} eq 'command')
		{
			$$result{command} = $params;
		}
		elsif ($$item{rule} eq 'input_file')
		{
			$$result{input_file} = $params;
		}
		elsif ($$item{rule} eq 'output_file')
		{
			$$result{output_file} = $params;
		}
		else
		{
			push @options,
			{
				name	=> $$item{rule},
				params	=> $$item{params},
				sign	=> $$item{sign},
			}
		}
	}

	$$result{options} = [@options];

	$self -> result($result);

} # End of _populate_result.

# ------------------------------------------------

sub run
{
	my($self, %options)	= @_;
	my(@command)		= $self -> _init(%options);
	my($message)		= $command[0] . (length($command[1]) ? " $command[1]" : '');

	$self -> log(info => "Command: '$message'");

	my($cache)	=
	{
		logger	=> $self -> logger,
		items	=> $self -> items,
		self	=> $self, # For access to logger within decode_result().
	};

	$self -> recce -> read(\$command[0]);

	my($result)				= $self -> recce -> value($cache);
	my($ambiguity_metric)	= $self -> recce -> ambiguity_metric;

	if ($ambiguity_metric <= 0)
	{
		my($line, $column)	= $self -> recce -> line_column();
		my($whole_length)	= length $command[0];
		my($suffix)			= substr($command[0], ($whole_length - 100) );
		my($suffix_length)	= length $suffix;
		my($s)				= $suffix_length == 1 ? 'char' : "$suffix_length chars";
		my($message)		= "Call to ambiguity_metric() returned $ambiguity_metric (i.e. an error). \n"
			. "Marpa exited at (line, column) = ($line, $column) within the input string. \n"
			. "Input length: $whole_length. Last $s of input: '$suffix'";

		$self -> log(error => "Error. Parse failed. $message");
	}
	elsif ($ambiguity_metric == 1)
	{
		$self -> log(debug => 'Parse is unambiguous');

		if (length $command[1])
		{
			$self -> items -> push
			({
				params	=> [$command[1]],
				sign	=> '',
				rule	=> 'output_file',
			});
		}

		$self -> _populate_result;

		my($format)= '%4s  %-20s  %-s';

		$self -> log(debug => sprintf($format, 'Sign', 'Rule', 'Params') );

		for my $item ($self -> items -> print)
		{
			$self -> log(debug => sprintf($format, $$item{sign}, $$item{rule}, join(', ', @{$$item{params} }) ) );
		}

		$self -> log(info => "Result: \n" . Dumper($self -> result) );
	}
	else
	{
		$self -> log(error => 'Error. Parse is ambiguous');
	}

	# Return 0 for success and 1 for failure.

	return 0;

} # End of write.

# ------------------------------------------------

1;

=pod

=head1 NAME

C<Image::Magick::CommandParser> - Parse any command line used by ImageMagick

=head1 Synopsis

See L<Tree::Cladogram/Synopsis>.

=head1 Description

See L<Tree::Cladogram/Description>.

=head1 Distributions

See L<Tree::Cladogram/Distributions>.

=head1 Constructor and Initialization

See L<Tree::Cladogram/Constructor and Initialization>.

=head1 Methods

See L<Tree::Cladogram/Methods>.

=head1 FAQ

See L<Tree::Cladogram/FAQ>.

=head1 See Also

See L<Tree::Cladogram/See Also>.

=head1 Machine-Readable Change Log

The file Changes was converted into Changelog.ini by L<Module::Metadata::Changes>.

=head1 Version Numbers

Version numbers < 1.00 represent development versions. From 1.00 up, they are production versions.

=head1 Repository

L<https://github.com/ronsavage/Tree-Cladogram>

=head1 Support

Email the author, or log a bug on RT:

L<https://rt.cpan.org/Public/Dist/Display.html?Name=Tree::Cladogram>.

=head1 Author

L<Tree::Cladogram> was written by Ron Savage I<E<lt>ron@savage.net.auE<gt>> in 2015.

My homepage: L<http://savage.net.au/>

=head1 Copyright

Australian copyright (c) 2015, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Artistic License 2.0, a copy of which is available at:
	http://opensource.org/licenses/alphabetical.

=cut

__DATA__
@@ image.magick.bnf
:default								::= action => ::first

lexeme default							= latm => 1		# Longest Acceptable Token Match.

# G1-level rules.

:start									::= command_and_options

command_and_options						::= command_name input_file_name option_rule_set

command_name							::= 'convert'	action => command_action
											| 'mogrify'	action => command_action

input_file_name							::= path_string	action => input_file_action
input_file_name							::=				action => input_file_action

option_rule_set							::= option_rule*

option_rule								::= adaptive_blur_rule | adaptive_resize_rule | adaptive_sharpen_rule | adjoin_rule | affine_rule | alpha_rule | annotate_rule | antialias_rule | append_rule | attenuate_rule | authenticate_rule | auto_gamma_rule | auto_level_rule | auto_orient_rule | average_rule | backdrop_rule | background_rule | bench_rule | bias_rule | black_point_compensation_rule | black_threshold_rule | blend_rule | blue_primary_rule | blue_shift_rule | blur_rule | border_rule | bordercolor_rule | borderwidth_rule | brightness_contrast_rule | cache_rule | canny_rule | caption_rule | cdl_rule | channel_rule | charcoal_rule | chop_rule | clamp_rule | clip_rule | clip_mask_rule | clip_path_rule | clone_rule | clut_rule | coalesce_rule | color_matrix_rule | colorize_rule | colormap_rule | colors_rule | colorspace_rule | combine_rule | comment_rule | compare_rule | complex_rule | compose_rule | composite_rule | compress_rule | connected_components_rule | contrast_rule | contrast_stretch_rule | convolve_rule | copy_rule | crop_rule | cycle_rule | debug_rule | decipher_rule | deconstruct_rule | delay_rule | delete_rule | density_rule | depth_rule | descend_rule | deskew_rule | despeckle_rule | direction_rule | displace_rule | display_rule | dispose_rule | dissimilarity_threshold_rule | dissolve_rule | distribute_cache_rule | dither_rule | draw_rule | duplicate_rule | edge_rule | emboss_rule | encipher_rule | encoding_rule | endian_rule | enhance_rule | equalize_rule | evaluate_rule | evaluate_sequence_rule | extent_rule | extract_rule | family_rule | features_rule | fft_rule | fill_rule | filter_rule | flatten_rule | flip_rule | floodfill_rule | flop_rule | font_rule | foreground_rule | format_rule | frame_rule | function_rule | fuzz_rule | fx_rule | gamma_rule | gaussian_blur_rule | geometry_rule | gravity_rule | grayscale_rule | green_primary_rule | hald_clut_rule | help_rule | highlight_color_rule | hough_lines_rule | iconGeometry_rule | iconic_rule | identify_rule | ift_rule | immutable_rule | implode_rule | insert_rule | intensity_rule | intent_rule | interlace_rule | interline_spacing_rule | interpolate_rule | interword_spacing_rule | kerning_rule | kuwahara_rule | label_rule | lat_rule | layers_rule | level_rule | level_colors_rule | limit_rule | linear_stretch_rule | linewidth_rule | liquid_rescale_rule | list_rule | log_rule | loop_rule | lowlight_color_rule | magnify_rule | map_rule | mask_rule | mattecolor_rule | maximum_rule | mean_shift_rule | median_rule | metric_rule | minimum_rule | mode_rule | modulate_rule | moments_rule | monitor_rule | monochrome_rule | morph_rule | mosaic_rule | motion_blur_rule | name_rule | negate_rule | noise_rule | normalize_rule | opaque_rule | orient_rule | page_rule | paint_rule | path_rule | pause_rule | perceptible_rule | ping_rule | pointsize_rule | polaroid_rule | posterize_rule | precision_rule | preview_rule | print_rule | process_rule | profile_rule | quality_rule | quantize_rule | quiet_rule | radial_blur_rule | raise_rule | random_threshold_rule | red_primary_rule | regard_warnings_rule | region_rule | remap_rule | remote_rule | render_rule | repage_rule | resample_rule | resize_rule | respect_parentheses_rule | reverse_rule | roll_rule | rotate_rule | sample_rule | sampling_factor_rule | scale_rule | scene_rule | screen_rule | seed_rule | segment_rule | selective_blur_rule | separate_rule | sepia_tone_rule | set_rule | shade_rule | shadow_rule | shared_memory_rule | sharpen_rule | shave_rule | shear_rule | sigmoidal_contrast_rule | silent_rule | similarity_threshold_rule | size_rule | sketch_rule | smush_rule | snaps_rule | solarize_rule | splice_rule | spread_rule | statistic_rule | stegano_rule | stereo_rule | storage_type_rule | stretch_rule | strip_rule | stroke_rule | strokewidth_rule | style_rule | subimage_search_rule | swap_rule | swirl_rule | synchronize_rule | taint_rule | text_font_rule | texture_rule | threshold_rule | thumbnail_rule | tile_rule | tile_offset_rule | tint_rule | title_rule | transform_rule | transparent_rule | transparent_color_rule | transpose_rule | transverse_rule | treedepth_rule | trim_rule | type_rule | undercolor_rule | unique_colors_rule | units_rule | unsharp_rule | update_rule | verbose_rule | version_rule | view_rule | vignette_rule | virtual_pixel_rule | visual_rule | watermark_rule | wave_rule | weight_rule | white_point_rule | white_threshold_rule | window_rule | window_group_rule | write_rule

adaptive_blur_rule						::= minus_sign 'adaptive-blur' radius	action => adaptive_blur_action_1

adaptive_resize_rule					::= minus_sign 'adaptive-resize' geometry	action => adaptive_resize_action_1

adaptive_sharpen_rule					::= minus_sign 'adaptive-sharpen' radius	action => adaptive_sharpen_action_1

adjoin_rule								::= minus_sign 'adjoin' 	action => adjoin_action_1

affine_rule								::= minus_sign 'affine' sx_rx_ry_sy_optional_tx_ty	action => affine_action_1

alpha_rule								::= minus_sign 'alpha' type	action => alpha_action_1

annotate_rule							::= minus_sign 'annotate' degrees text	action => annotate_action_1
											| plus_sign 'annotate' Xdegrees x Ydegrees text	action => annotate_action_2
											| plus_sign 'annotate' Xdegrees x Ydegrees plus_or_minus tx plus_or_minus ty text	action => annotate_action_3
											| plus_sign 'annotate' plus_or_minus tx plus_or_minus ty text	action => annotate_action_4

antialias_rule							::= minus_sign 'antialias' 	action => antialias_action_1

append_rule								::= minus_sign 'append' 	action => append_action_1

attenuate_rule							::= minus_sign 'attenuate' value	action => attenuate_action_1

authenticate_rule						::= minus_sign 'authenticate' password	action => authenticate_action_1

auto_gamma_rule							::= minus_sign 'auto-gamma' 	action => auto_gamma_action_1

auto_level_rule							::= minus_sign 'auto-level' 	action => auto_level_action_1

auto_orient_rule						::= minus_sign 'auto-orient' 	action => auto_orient_action_1

average_rule							::= minus_sign 'average' 	action => average_action_1

backdrop_rule							::= minus_sign 'backdrop' 	action => backdrop_action_1

background_rule							::= minus_sign 'background' color	action => background_action_1

bench_rule								::= minus_sign 'bench' iterations	action => bench_action_1

bias_rule								::= minus_sign 'bias' value optional_percent	action => bias_action_1

black_point_compensation_rule			::= minus_sign 'black-point-compensation' 	action => black_point_compensation_action_1

black_threshold_rule					::= minus_sign 'black-threshold' value optional_percent	action => black_threshold_action_1

blend_rule								::= minus_sign 'blend' geometry	action => blend_action_1

blue_primary_rule						::= minus_sign 'blue-primary' x comma y	action => blue_primary_action_1

blue_shift_rule							::= minus_sign 'blue-shift' factor	action => blue_shift_action_1

blur_rule								::= minus_sign 'blur' radius	action => blur_action_1
											| plus_sign 'blur' radius x sigma	action => blur_action_2
											| minus_sign 'blur' width	action => blur_action_3

border_rule								::= minus_sign 'border' geometry	action => border_action_1

bordercolor_rule						::= minus_sign 'bordercolor' color	action => bordercolor_action_1

borderwidth_rule						::= minus_sign 'borderwidth' geometry	action => borderwidth_action_1

brightness_contrast_rule				::= minus_sign 'brightness-contrast' brightness	action => brightness_contrast_action_1
											| plus_sign 'brightness-contrast' brightness optional_percent	action => brightness_contrast_action_2

cache_rule								::= minus_sign 'cache' threshold	action => cache_action_1

canny_rule								::= minus_sign 'canny' radius	action => canny_action_1
											| plus_sign 'canny' radius x sigma optional_lower_percent optional_upper_percent	action => canny_action_2

caption_rule							::= minus_sign 'caption' string	action => caption_action_1

cdl_rule								::= minus_sign 'cdl' filename	action => cdl_action_1

channel_rule							::= minus_sign 'channel' type	action => channel_action_1

charcoal_rule							::= minus_sign 'charcoal' factor	action => charcoal_action_1

chop_rule								::= minus_sign 'chop' geometry	action => chop_action_1

clamp_rule								::= minus_sign 'clamp' 	action => clamp_action_1

clip_rule								::= minus_sign 'clip' 	action => clip_action_1
clip_rule								::= plus_sign 'clip' 	action => clip_action_1

clip_mask_rule							::= minus_sign 'clip-mask' 	action => clip_mask_action_1

clip_path_rule							::= minus_sign 'clip-path' id	action => clip_path_action_1

clone_rule								::= minus_sign 'clone' indexes	action => clone_action_1

clut_rule								::= minus_sign 'clut' 	action => clut_action_1

coalesce_rule							::= minus_sign 'coalesce' 	action => coalesce_action_1

color_matrix_rule						::= minus_sign 'color-matrix' matrix	action => color_matrix_action_1

colorize_rule							::= minus_sign 'colorize' value	action => colorize_action_1

colormap_rule							::= minus_sign 'colormap' type	action => colormap_action_1

colors_rule								::= minus_sign 'colors' value	action => colors_action_1

colorspace_rule							::= minus_sign 'colorspace' value	action => colorspace_action_1

combine_rule							::= minus_sign 'combine' 	action => combine_action_1

comment_rule							::= minus_sign 'comment' string	action => comment_action_1

compare_rule							::= minus_sign 'compare' 	action => compare_action_1

complex_rule							::= minus_sign 'complex' operator	action => complex_action_1

compose_rule							::= minus_sign 'compose' operator	action => compose_action_1

composite_rule							::= minus_sign 'composite' 	action => composite_action_1

compress_rule							::= minus_sign 'compress' type	action => compress_action_1

connected_components_rule				::= minus_sign 'connected-components' connectivity	action => connected_components_action_1

contrast_rule							::= minus_sign 'contrast' 	action => contrast_action_1

contrast_stretch_rule					::= minus_sign 'contrast-stretch' black_point	action => contrast_stretch_action_1
											| plus_sign 'contrast-stretch' black_point optional_percent	action => contrast_stretch_action_2

convolve_rule							::= minus_sign 'convolve' kernel	action => convolve_action_1

copy_rule								::= minus_sign 'copy' geometry offset	action => copy_action_1

crop_rule								::= minus_sign 'crop' geometry optional_at_sign optional_exclamation_point	action => crop_action_1

cycle_rule								::= minus_sign 'cycle' amount	action => cycle_action_1

debug_rule								::= minus_sign 'debug' events	action => debug_action_1

decipher_rule							::= minus_sign 'decipher' filename	action => decipher_action_1

deconstruct_rule						::= minus_sign 'deconstruct' 	action => deconstruct_action_1

delay_rule								::= minus_sign 'delay' ticks	action => delay_action_1
											| plus_sign 'delay' ticks x ticks_per_second optional_greater_than optional_greater_than	action => delay_action_2

delete_rule								::= minus_sign 'delete' indexes	action => delete_action_1

density_rule							::= minus_sign 'density' width	action => density_action_1
											| plus_sign 'density' width x height	action => density_action_2

depth_rule								::= minus_sign 'depth' value	action => depth_action_1

descend_rule							::= minus_sign 'descend' 	action => descend_action_1

deskew_rule								::= minus_sign 'deskew' threshold	action => deskew_action_1

despeckle_rule							::= minus_sign 'despeckle' 	action => despeckle_action_1

direction_rule							::= minus_sign 'direction' type	action => direction_action_1

displace_rule							::= minus_sign 'displace' horizontal_scale	action => displace_action_1
											| plus_sign 'displace' horizontal_scale x vertical_scale	action => displace_action_2

display_rule							::= minus_sign 'display' host_display_optional_dot_screen	action => display_action_1

dispose_rule							::= minus_sign 'dispose' method	action => dispose_action_1

dissimilarity_threshold_rule			::= minus_sign 'dissimilarity-threshold' value	action => dissimilarity_threshold_action_1

dissolve_rule							::= minus_sign 'dissolve' src_percent	action => dissolve_action_1

distribute_cache_rule					::= minus_sign 'distribute-cache' port	action => distribute_cache_action_1

dither_rule								::= minus_sign 'dither' method	action => dither_action_1

draw_rule								::= minus_sign 'draw' string	action => draw_action_1

duplicate_rule							::= minus_sign 'duplicate' count comma indexes	action => duplicate_action_1

edge_rule								::= minus_sign 'edge' radius	action => edge_action_1

emboss_rule								::= minus_sign 'emboss' radius	action => emboss_action_1

encipher_rule							::= minus_sign 'encipher' filename	action => encipher_action_1

encoding_rule							::= minus_sign 'encoding' type	action => encoding_action_1

endian_rule								::= minus_sign 'endian' type	action => endian_action_1

enhance_rule							::= minus_sign 'enhance' 	action => enhance_action_1

equalize_rule							::= minus_sign 'equalize' 	action => equalize_action_1

evaluate_rule							::= minus_sign 'evaluate' operator value	action => evaluate_action_1

evaluate_sequence_rule					::= minus_sign 'evaluate-sequence' operator	action => evaluate_sequence_action_1

extent_rule								::= minus_sign 'extent' geometry	action => extent_action_1

extract_rule							::= minus_sign 'extract' geometry	action => extract_action_1

family_rule								::= minus_sign 'family' fontFamily	action => family_action_1

features_rule							::= minus_sign 'features' distance	action => features_action_1

fft_rule								::= minus_sign 'fft' 	action => fft_action_1

fill_rule								::= minus_sign 'fill' color	action => fill_action_1

filter_rule								::= minus_sign 'filter' type	action => filter_action_1

flatten_rule							::= minus_sign 'flatten' 	action => flatten_action_1

flip_rule								::= minus_sign 'flip' 	action => flip_action_1

floodfill_rule							::= minus_sign 'floodfill' plus_or_minus x plus_or_minus y color	action => floodfill_action_1

flop_rule								::= minus_sign 'flop' 	action => flop_action_1

font_rule								::= minus_sign 'font' name	action => font_action_1

foreground_rule							::= minus_sign 'foreground' color	action => foreground_action_1

format_rule								::= minus_sign 'format' type	action => format_action_1
											| minus_sign 'format' string	action => format_action_2

frame_rule								::= minus_sign 'frame' geometry	action => frame_action_1
											| minus_sign 'frame' 	action => frame_action_2

function_rule							::= minus_sign 'function' function parameters	action => function_action_1

fuzz_rule								::= minus_sign 'fuzz' distance optional_percent	action => fuzz_action_1

fx_rule									::= minus_sign 'fx' expression	action => fx_action_1

gamma_rule								::= minus_sign 'gamma' value	action => gamma_action_1

gaussian_blur_rule						::= minus_sign 'gaussian-blur' radius	action => gaussian_blur_action_1
											| plus_sign 'gaussian-blur' radius x sigma	action => gaussian_blur_action_2

geometry_rule							::= minus_sign 'geometry' geometry	action => geometry_action_1

gravity_rule							::= minus_sign 'gravity' type	action => gravity_action_1

grayscale_rule							::= minus_sign 'grayscale' method	action => grayscale_action_1

green_primary_rule						::= minus_sign 'green-primary' x comma y	action => green_primary_action_1

hald_clut_rule							::= minus_sign 'hald-clut' 	action => hald_clut_action_1

help_rule								::= minus_sign 'help' 	action => help_action_1

highlight_color_rule					::= minus_sign 'highlight-color' color	action => highlight_color_action_1

hough_lines_rule						::= minus_sign 'hough-lines' width x height optional_threshold	action => hough_lines_action_1

iconGeometry_rule						::= minus_sign 'iconGeometry' geometry	action => iconGeometry_action_1

iconic_rule								::= minus_sign 'iconic' 	action => iconic_action_1

identify_rule							::= minus_sign 'identify' 	action => identify_action_1

ift_rule								::= minus_sign 'ift' 	action => ift_action_1

immutable_rule							::= minus_sign 'immutable' 	action => immutable_action_1

implode_rule							::= minus_sign 'implode' factor	action => implode_action_1

insert_rule								::= minus_sign 'insert' index	action => insert_action_1

intensity_rule							::= minus_sign 'intensity' method	action => intensity_action_1

intent_rule								::= minus_sign 'intent' type	action => intent_action_1

interlace_rule							::= minus_sign 'interlace' type	action => interlace_action_1

interline_spacing_rule					::= minus_sign 'interline-spacing' value	action => interline_spacing_action_1

interpolate_rule						::= minus_sign 'interpolate' type	action => interpolate_action_1

interword_spacing_rule					::= minus_sign 'interword-spacing' value	action => interword_spacing_action_1

kerning_rule							::= minus_sign 'kerning' value	action => kerning_action_1

kuwahara_rule							::= minus_sign 'kuwahara' radius	action => kuwahara_action_1
											| plus_sign 'kuwahara' radius x sigma	action => kuwahara_action_2

label_rule								::= minus_sign 'label' name	action => label_action_1

lat_rule								::= minus_sign 'lat' width	action => lat_action_1
											| plus_sign 'lat' width x height plus_or_minus offset optional_percent	action => lat_action_2

layers_rule								::= minus_sign 'layers' method	action => layers_action_1

level_rule								::= minus_sign 'level' black_point optional_percent optional_comma_white_point optional_percent optional_comma_gamma	action => level_action_1

level_colors_rule						::= minus_sign 'level-colors' black_color comma white_color	action => level_colors_action_1

limit_rule								::= minus_sign 'limit' type value	action => limit_action_1

linear_stretch_rule						::= minus_sign 'linear-stretch' black_point	action => linear_stretch_action_1
											| plus_sign 'linear-stretch' black_point optional_percent	action => linear_stretch_action_2

linewidth_rule							::= minus_sign 'linewidth' 	action => linewidth_action_1

liquid_rescale_rule						::= minus_sign 'liquid-rescale' geometry	action => liquid_rescale_action_1

list_rule								::= minus_sign 'list' type	action => list_action_1

log_rule								::= minus_sign 'log' string	action => log_action_1

loop_rule								::= minus_sign 'loop' iterations	action => loop_action_1

lowlight_color_rule						::= minus_sign 'lowlight-color' color	action => lowlight_color_action_1

magnify_rule							::= minus_sign 'magnify' 	action => magnify_action_1

map_rule								::= minus_sign 'map' type	action => map_action_1
											| minus_sign 'map' components	action => map_action_2

mask_rule								::= minus_sign 'mask' filename	action => mask_action_1

mattecolor_rule							::= minus_sign 'mattecolor' color	action => mattecolor_action_1

maximum_rule							::= minus_sign 'maximum' 	action => maximum_action_1

mean_shift_rule							::= minus_sign 'mean-shift' width x height optional_plus_sign_distance optional_percent	action => mean_shift_action_1

median_rule								::= minus_sign 'median' geometry	action => median_action_1

metric_rule								::= minus_sign 'metric' type	action => metric_action_1

minimum_rule							::= minus_sign 'minimum' 	action => minimum_action_1

mode_rule								::= minus_sign 'mode' geometry	action => mode_action_1
											| minus_sign 'mode' value	action => mode_action_2

modulate_rule							::= minus_sign 'modulate' brightness_optional_saturation_hue	action => modulate_action_1

moments_rule							::= minus_sign 'moments' 	action => moments_action_1

monitor_rule							::= minus_sign 'monitor' 	action => monitor_action_1

monochrome_rule							::= minus_sign 'monochrome' 	action => monochrome_action_1

morph_rule								::= minus_sign 'morph' frames	action => morph_action_1

mosaic_rule								::= minus_sign 'mosaic' 	action => mosaic_action_1

motion_blur_rule						::= minus_sign 'motion-blur' radius	action => motion_blur_action_1
											| plus_sign 'motion-blur' radius x sigma plus_sign angle	action => motion_blur_action_2

name_rule								::= minus_sign 'name' 	action => name_action_1

negate_rule								::= minus_sign 'negate' 	action => negate_action_1

noise_rule								::= minus_sign 'noise' geometry	action => noise_action_1
											| plus_sign 'noise' type	action => noise_action_2

normalize_rule							::= minus_sign 'normalize' 	action => normalize_action_1

opaque_rule								::= minus_sign 'opaque' color	action => opaque_action_1

orient_rule								::= minus_sign 'orient' image orientation	action => orient_action_1

page_rule								::= minus_sign 'page' geometry	action => page_action_1
											| plus_sign 'page' media optional_offset optional_geometry_suffix	action => page_action_2
											| plus_sign 'page' 	action => page_action_3

paint_rule								::= minus_sign 'paint' radius	action => paint_action_1

path_rule								::= minus_sign 'path' path	action => path_action_1

pause_rule								::= minus_sign 'pause' seconds	action => pause_action_1
perceptible_rule						::= minus_sign 'perceptible' epsilon	action => perceptible_action_1

ping_rule								::= minus_sign 'ping' 	action => ping_action_1

pointsize_rule							::= minus_sign 'pointsize' value	action => pointsize_action_1

polaroid_rule							::= minus_sign 'polaroid' angle	action => polaroid_action_1

posterize_rule							::= minus_sign 'posterize' levels	action => posterize_action_1

precision_rule							::= minus_sign 'precision' value	action => precision_action_1

preview_rule							::= minus_sign 'preview' type	action => preview_action_1

print_rule								::= minus_sign 'print' string	action => print_action_1

process_rule							::= minus_sign 'process' command	action => process_action_1

profile_rule							::= minus_sign 'profile' filename	action => profile_action_1
											| plus_sign 'profile' profile_name	action => profile_action_2

quality_rule							::= minus_sign 'quality' value	action => quality_action_1

quantize_rule							::= minus_sign 'quantize' colorspace	action => quantize_action_1

quiet_rule								::= minus_sign 'quiet' 	action => quiet_action_1

radial_blur_rule						::= minus_sign 'radial-blur' angle	action => radial_blur_action_1

raise_rule								::= minus_sign 'raise' thickness	action => raise_action_1

random_threshold_rule					::= minus_sign 'random-threshold' low x high	action => random_threshold_action_1

red_primary_rule						::= minus_sign 'red-primary' x comma y	action => red_primary_action_1

regard_warnings_rule					::= minus_sign 'regard-warnings' 	action => regard_warnings_action_1

region_rule								::= minus_sign 'region' geometry	action => region_action_1

remap_rule								::= minus_sign 'remap' filename	action => remap_action_1

remote_rule								::= minus_sign 'remote' 	action => remote_action_1

render_rule								::= minus_sign 'render' 	action => render_action_1

repage_rule								::= minus_sign 'repage' geometry	action => repage_action_1

resample_rule							::= minus_sign 'resample' horizontal x vertical	action => resample_action_1

resize_rule								::= minus_sign 'resize' geometry	action => resize_action_1

respect_parentheses_rule				::= minus_sign 'respect-parentheses' 	action => respect_parentheses_action_1

reverse_rule							::= minus_sign 'reverse' 	action => reverse_action_1

roll_rule								::= minus_sign 'roll' plus_or_minus x plus_or_minus y	action => roll_action_1

rotate_rule								::= minus_sign 'rotate' degrees optional_less_or_greater_than	action => rotate_action_1

sample_rule								::= minus_sign 'sample' geometry	action => sample_action_1

sampling_factor_rule					::= minus_sign 'sampling-factor' horizontal_factor x vertical_factor	action => sampling_factor_action_1

scale_rule								::= minus_sign 'scale' geometry	action => scale_action_1

scene_rule								::= minus_sign 'scene' value	action => scene_action_1

screen_rule								::= minus_sign 'screen' 	action => screen_action_1

seed_rule								::= minus_sign 'seed' 	action => seed_action_1

segment_rule							::= minus_sign 'segment' cluster_threshold x smoothing_threshold	action => segment_action_1

selective_blur_rule						::= minus_sign 'selective-blur' radius	action => selective_blur_action_1
											| plus_sign 'selective-blur' radius x sigma optional_threshold	action => selective_blur_action_2

separate_rule							::= minus_sign 'separate' 	action => separate_action_1

sepia_tone_rule							::= minus_sign 'sepia-tone' threshold	action => sepia_tone_action_1

set_rule								::= minus_sign 'set' key value	action => set_action_1
											| plus_sign 'set' key	action => set_action_2

shade_rule								::= minus_sign 'shade' azimuthxelevation	action => shade_action_1

shadow_rule								::= minus_sign 'shadow' percent_opacity plus_or_minus x plus_or_minus y optional_percent	action => shadow_action_1

shared_memory_rule						::= minus_sign 'shared-memory' 	action => shared_memory_action_1

sharpen_rule							::= minus_sign 'sharpen' radius	action => sharpen_action_1
											| plus_sign 'sharpen' radius x sigma	action => sharpen_action_2

shave_rule								::= minus_sign 'shave' geometry	action => shave_action_1

shear_rule								::= minus_sign 'shear' Xdegrees	action => shear_action_1

sigmoidal_contrast_rule					::= minus_sign 'sigmoidal-contrast' contrast x mid_point	action => sigmoidal_contrast_action_1

silent_rule								::= minus_sign 'silent' 	action => silent_action_1

similarity_threshold_rule				::= minus_sign 'similarity-threshold' value	action => similarity_threshold_action_1

size_rule								::= minus_sign 'size' width optional_canvas_palette	action => size_action_1

sketch_rule								::= minus_sign 'sketch' radius	action => sketch_action_1
											| plus_sign 'sketch' radius x sigma plus_sign angle	action => sketch_action_2

smush_rule								::= minus_sign 'smush' offset	action => smush_action_1

snaps_rule								::= minus_sign 'snaps' value	action => snaps_action_1

solarize_rule							::= minus_sign 'solarize' threshold	action => solarize_action_1

splice_rule								::= minus_sign 'splice' geometry	action => splice_action_1

spread_rule								::= minus_sign 'spread' amount	action => spread_action_1

statistic_rule							::= minus_sign 'statistic' type geometry	action => statistic_action_1

stegano_rule							::= minus_sign 'stegano' offset	action => stegano_action_1

stereo_rule								::= minus_sign 'stereo' plus_sign x optional_plus_sign_y	action => stereo_action_1

storage_type_rule						::= minus_sign 'storage-type' type	action => storage_type_action_1

stretch_rule							::= minus_sign 'stretch' fontStretch	action => stretch_action_1

strip_rule								::= minus_sign 'strip' 	action => strip_action_1

stroke_rule								::= minus_sign 'stroke' color	action => stroke_action_1

strokewidth_rule						::= minus_sign 'strokewidth' value	action => strokewidth_action_1

style_rule								::= minus_sign 'style' fontStyle	action => style_action_1

subimage_search_rule					::= minus_sign 'subimage-search' 	action => subimage_search_action_1

swap_rule								::= minus_sign 'swap' index comma index	action => swap_action_1

swirl_rule								::= minus_sign 'swirl' degrees	action => swirl_action_1

synchronize_rule						::= minus_sign 'synchronize' 	action => synchronize_action_1

taint_rule								::= minus_sign 'taint' 	action => taint_action_1

text_font_rule							::= minus_sign 'text-font' name	action => text_font_action_1

texture_rule							::= minus_sign 'texture' filename	action => texture_action_1

threshold_rule							::= minus_sign 'threshold' value optional_percent	action => threshold_action_1

thumbnail_rule							::= minus_sign 'thumbnail' geometry	action => thumbnail_action_1

tile_rule								::= minus_sign 'tile' filename	action => tile_action_1
											| minus_sign 'tile' geometry	action => tile_action_2
											| minus_sign 'tile' 	action => tile_action_3

tile_offset_rule						::= minus_sign 'tile-offset' plus_or_minus x plus_or_minus y	action => tile_offset_action_1

tint_rule								::= minus_sign 'tint' value	action => tint_action_1

title_rule								::= minus_sign 'title' string	action => title_action_1

transform_rule							::= minus_sign 'transform' 	action => transform_action_1

transparent_rule						::= minus_sign 'transparent' color	action => transparent_action_1

transparent_color_rule					::= minus_sign 'transparent-color' color	action => transparent_color_action_1

transpose_rule							::= minus_sign 'transpose' 	action => transpose_action_1

transverse_rule							::= minus_sign 'transverse' 	action => transverse_action_1

treedepth_rule							::= minus_sign 'treedepth' value	action => treedepth_action_1

trim_rule								::= minus_sign 'trim' 	action => trim_action_1

type_rule								::= minus_sign 'type' type	action => type_action_1

undercolor_rule							::= minus_sign 'undercolor' color	action => undercolor_action_1

unique_colors_rule						::= minus_sign 'unique-colors' 	action => unique_colors_action_1

units_rule								::= minus_sign 'units' type	action => units_action_1

unsharp_rule							::= minus_sign 'unsharp' radius	action => unsharp_action_1
											| plus_sign 'unsharp' radius x sigma optional_gain optional_threshold	action => unsharp_action_2

update_rule								::= minus_sign 'update' seconds	action => update_action_1

verbose_rule							::= minus_sign 'verbose' 	action => verbose_action_1

version_rule							::= minus_sign 'version' 	action => version_action_1

view_rule								::= minus_sign 'view' string	action => view_action_1

vignette_rule							::= minus_sign 'vignette' radius plus_or_minus x plus_or_minus y optional_percent	action => vignette_action_1

virtual_pixel_rule						::= minus_sign 'virtual-pixel' method	action => virtual_pixel_action_1

visual_rule								::= minus_sign 'visual' type	action => visual_action_1

watermark_rule							::= minus_sign 'watermark' brightness x saturation	action => watermark_action_1

wave_rule								::= minus_sign 'wave' amplitude	action => wave_action_1
											| plus_sign 'wave' amplitude x wavelength	action => wave_action_2

weight_rule								::= minus_sign 'weight' fontWeight	action => weight_action_1

white_point_rule						::= minus_sign 'white-point' x comma y	action => white_point_action_1

white_threshold_rule					::= minus_sign 'white-threshold' value optional_percent	action => white_threshold_action_1

window_rule								::= minus_sign 'window' id	action => window_action_1

window_group_rule						::= minus_sign 'window-group' 	action => window_group_action_1

write_rule								::= minus_sign 'write' filename	action => write_action_1

# G1 lexemes from ImageMagick command options.

amount									::= comma_separated_integers

amplitude								::= real_number

angle									::= real_number

azimuthxelevation						::= string

black_color								::= string

black_point								::= string

brightness								::= real_number

brightness_optional_saturation_hue		::= real_number

cluster_threshold						::= integer

color									::= string

colorspace								::= color_space_list

command									::= string

components								::= color_prefix_list

connectivity							::= integer

contrast								::= integer

count									::= integer

degrees									::= real_number

distance								::= string

epsilon									::= real_number

events									::= comma_separated_events

expression								::= string

factor									::= real_number

filename								::= string

fontFamily								::= string

fontStretch								::= string

fontStyle								::= string

fontWeight								::= string

frames									::= integer

function								::= string

geometry								::= geometry_string

height									::= real_number

high									::= real_number

horizontal								::= integer

horizontal_factor						::= integer

horizontal_scale						::= integer

host_display_optional_dot_screen		::= string

id										::= string

image									::= string

index									::= image_list

indexes									::= image_list

iterations								::= integer

kernel									::= comma_separated_reals

key										::= string

levels									::= comma_separated_integers

low										::= real_number

matrix									::= string

media									::= string

method									::= string

mid_point								::= integer

name									::= string

offset									::= offset_list

operator								::= string

optional_comma_gamma					::= string

optional_comma_white_point				::= string

optional_gain							::= string

optional_geometry_suffix				::= string

optional_lower_percent					::= string

optional_offset							::= string

optional_canvas_palette					::= path_string*

optional_plus_sign_distance				::= string

optional_threshold						::= string

optional_upper_percent					::= string

orientation								::= string

parameters								::= string

password								::= string

path									::= string

percent_opacity							::= real_number

port									::= integer

profile_name							::= string

radius									::= string

saturation								::= real_number

seconds									::= integer

sigma									::= real_number

smoothing_threshold						::= real_number

src_percent								::= real_number

sx_rx_ry_sy_optional_tx_ty				::= comma_separated_reals

text									::= string

thickness								::= integer

threshold								::= real_number

ticks									::= integer

ticks_per_second						::= integer

tx										::= real_number

ty										::= real_number

type									::= string

value									::= string

vertical								::= integer

vertical_factor							::= real_number

vertical_scale							::= integer

wavelength								::= real_number

white_color								::= string

width									::= string

x										::= integer

Xdegrees								::= real_number

y										::= integer

Ydegrees								::= real_number

# G1 lexemes from option parameters.

color_prefix_list						::= string

color_space_list						::= string

comma_separated_events					::= string

comma_separated_integers				::= string

comma_separated_reals					::= string

geometry_string							::= string

image_list								::= string

offset_list								::= string

real_number								::= string

# L0 lexemes from option parameters.

comma								~ ','

integer								~ '[\d]+'

minus_sign							~ '-'

optional_at_sign					~ '@'

optional_exclamation_point			~ '!'

optional_greater_than				~ '>'

optional_less_or_greater_than		~ '<'

optional_percent					~ '%'

optional_plus_sign_y				~ '+'

plus_or_minus						~ '[+-]'

plus_sign							~ '+'

# L0 lexemes for the boilerplate.

path_string								~ path_set+
path_set								~ [^-+\s]

string									~ char_set+
char_set								~ [^\s]

:discard								~ whitespace
whitespace								~ [\s]+

@@ image.formats
3fr
a
aai
ai
art
arw
avi
avs
b
bgr
bgra
bgro
bmp
bmp2
bmp3
brf
c
cal
cals
canvas
caption
cin
cip
clip
cmyk
cmyka
cr2
crw
cur
cut
data
dcm
dcr
dcx
dds
dfont
dng
dot
dpx
dxt1
dxt5
epdf
epi
eps
eps2
eps3
epsf
epsi
erf
fax
fits
fractal
fts
g
g3
gif
gif87
gradient
gray
gv
h
hald
hdr
histogram
hrz
htm
html
icb
ico
icon
iiq
info
inline
ipl
isobrl
isobrl6
jng
jnx
jpe
jpeg
jpg
jps
json
k
k25
kdc
label
m
m2v
m4v
mac
magick
map
mask
mat
matte
mef
miff
mkv
mng
mono
mov
mp4
mpc
mpeg
mpg
mrw
msl
msvg
mtv
mvg
nef
nrw
null
o
orf
otb
otf
pal
palm
pam
pango
pattern
pbm
pcd
pcds
pcl
pct
pcx
pdb
pdf
pdfa
pef
pes
pfa
pfb
pfm
pgm
picon
pict
pix
pjpeg
plasma
png
png00
png24
png32
png48
png64
png8
pnm
ppm
preview
ps
ps2
ps3
psb
psd
pwp
r
radial-gradient
raf
ras
raw
rgb
rgba
rgbo
rgf
rla
rle
rmf
rw2
scr
screenshot
sct
sfw
sgi
shtml
six
sixel
sparse-color
sr2
srf
stegano
sun
svg
svgz
text
tga
thumbnail
tile
tim
ttc
ttf
txt
ubrl
ubrl6
uil
uyvy
vda
vicar
vid
viff
vips
vst
wbmp
wmv
wpg
x
x3f
xbm
xc
xcf
xpm
xps
xv
xwd
y
ycbcr
ycbcra
yuv
