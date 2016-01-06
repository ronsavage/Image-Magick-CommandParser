#!/usr/bin/env perl

use feature 'say';
use integer; # For $x % $y.
use strict;
use warnings;
use warnings qw(FATAL utf8);

use File::Slurper 'read_lines';

use HTML::Entities;
use HTML::TreeBuilder;

# ----------------------------------------------

sub build_bnf
{
	my($debug_target, $lines)	= @_;
	my($max_length)				= 0;

	my(%bnf);
	my($option);

	for my $line (@$lines)
	{
		$option			= $$line{name};
		$bnf{$option}	= [] if (! $bnf{$option});
		$max_length		= length($option) if (length($option) > $max_length);

		push @{$bnf{$option} },
			{
				parameters	=> $$line{parameters},
				sign		=> $$line{sign},
			};
	}

	$max_length		+= 5; # 5 = length('_rule').
	my($total_tabs)	= ($max_length / 4) + ($max_length % 4 == 0 ? 1 : 2);

	my($action, %actions);
	my(@bnf);
	my($count);
	my($item);
	my(%lexemes);
	my($parameters);
	my($sign, $spacer, $s);
	my($token, $token_length, $tab_count);

	push @bnf, << "EOS";
:default								::= action => [values]

lexeme default							= latm => 1		# Longest Acceptable Token Match.

# G1-level rules.

:start									::= command_and_options

command_and_options						::= command_name option

command_name							::= convert_name
											| identify_name
											| mogrify_name
EOS

	my(@option_name)	= sort keys %bnf;
	my($option_name)	= join(' | ', map{"${_}_rule"} @option_name);

	push @bnf, << "EOS";
option									::= $option_name
EOS

	for $option (sort keys %bnf)
	{
		$count = 0;

		for my $i (0 .. $#{$bnf{$option} })
		{
			$count++;

			$item			= $bnf{$option}[$i];
			$sign			= $$item{sign} eq '-' ? 'minus_sign' : 'plus_sign';
			$parameters		= $$item{parameters};
			$token			= $option;
			$token_length	= length($token) + 5; # # 5 = length('_rule').

			if (! $lexemes{$parameters})
			{
				$lexemes{$parameters} = build_parameters($debug_target, $token, $parameters);
			}

			$action				= "${token}_action_$count";
			$actions{$action}	= 1;
			$parameters 		= join(' ', @{$lexemes{$parameters} });

			if ($count == 1)
			{
				$tab_count	= ($token_length / 4) + 1;
				$spacer		= "\t" x ($total_tabs - $tab_count + 1); # Perl needs \t before ::=.
				$s			= "${token}_rule$spacer\t::= $sign $token $parameters\t action => $action";
			}
			else
			{
				$spacer		= "\t" x ($total_tabs + 1);
				$s			= "$spacer\t| $sign $token $parameters\t action => $action";
			}

			$s .= "\n" if ($count == $#{$bnf{$option} } + 1);

			push @bnf, $s;
		}
	}

	return (\@bnf, \%lexemes, \@option_name, \%actions);

} # End of build_bnf.

# ----------------------------------------------

sub build_parameters
{
	my($debug_target, $option, $parameters)	= @_;
	my(%special_words)						=
	(	# These contain 'x'.
		expression	=> 1,
		indexes		=> 1,
		text		=> 1,
	);

	my(@field);
	my($infix);
	my(@lexeme);
	my($prefix);
	my($result);
	my($suffix);

	for my $token (split(/\s+/, $parameters) )
	{
		if ($token =~ /^([_a-zA-Z]+)$/)
		{
			if ($special_words{$token})
			{
				$result = $token;
			}
			elsif ($token =~ /(.+)x(.+)/)
			{
				# Expect:
				# o 'XdegreesxYdegrees', for 'annotate'.

				$field[0]	= $1;
				$field[1]	= $2;
				$result		= "$field[0] x $field[1]";
			}
			else
			{
				$result = $token;
			}
		}
		elsif ($token =~ /^(\{[<>]})$/)
		{
			# Expect:
			# o 'ticksxticks_per_second {<} {>}', for 'delay'.

			$result = $1 eq '<' ? 'optional_less_than' : 'optional_greater_than';
		}
		elsif ($token =~ /^([a-zA-Z]+)\(s\)$/)
		{
			# Expect:
			# o 'index(s)', for 'clone'.

			$result = "$1es";
		}
		elsif ($token =~ /^([a-zA-Z]+)\{<}\{>}$/)
		{
			# Expect:
			# o 'degrees{<}{>}', for 'rotate'.

			$result = "$1 optional_less_or_greater_than";
		}
		elsif ($token =~ /^([_a-zA-Z]+),([_a-zA-Z]+)$/)
		{
			# Expect:
			# o 'x,y', for 'blue_primary'.

			$result = "$1 comma $2";
		}
		elsif ($token =~ /^\+([_a-zA-Z]+)\{\+([_a-zA-Z]+)}$/)
		{
			# Expect:
			# o '+x{+y}', for 'stereo'.

			$result = "plus $1 optional_plus_$2";
		}
		elsif ($token eq 'host:display[.screen]')
		{
			$result = 'host_display_optional_dot_screen';
		}
		elsif ($token =~ /^([_,a-zA-Z]+)\[([_,a-zA-Z]+)\]$/)
		{
			# Expect:
			# o 'radius[xsigma]', for 'adaptive_blur'.
			# o 'sx,rx,ry,sy[,tx,ty]', for 'affine'.
			# o 'Xdegrees[xYdegrees]' for 'shear'.

			$field[0]	= $1;
			$field[1]	= $2;

			if ($field[1] =~ /^x(.+)/)
			{
				$field[1]	= $1;
				$result		= "$field[0] optional_x_$field[1]";
			}
			else
			{
				# Note: the 2nd split has a leading ','.
				# Hence not "...optional_$suffix".

				$prefix	= join('_', split(/,/, $field[0]) );
				$suffix	= join('_', split(/,/, $field[1]) );

				$result = "${prefix}_optional$suffix";
			 }
		}
		elsif ($token =~ /^([a-zA-Z]+)\[x([a-zA-Z]+)\]\[\+([a-zA-Z]+)\]$/)
		{
			# Expect:
			# o 'width[xheight][+offset]' for 'size'.

			$result = "$1 optional_x_$2 optional_plus_$3";
		}
		elsif ($token =~ /^([a-zA-Z]+)\[([a-zA-Z]+)\]\[(.+)\]$/)
		{
			# Expect:
			# o 'media[offset][{^!<>}]' for 'page'.

			$result = "$1 optional_$2 optional_geometry_suffix";
		}
		elsif ($token =~ /^([a-zA-Z]+)\[x([a-zA-Z]+)\[\+([a-zA-Z]+)\]\]$/)
		{
			# Expect:
			# o 'Width[xHeight[+Angle]]' for 'blur'.

			$field[0]	= lc $1;
			$field[1]	= lc $2;
			$field[2]	= lc $3;

			$result = "$field[0] optional_x_$field[1]_optional_plus_$field[2]";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)\+([a-zA-Z]+)$/)
		{
			# Expect:
			# o 'radiusxsigma+angle' for 'motion-blur'.

			$result = "$1 x $2 plus $3";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)\{\+([a-zA-Z]+)\{%}}$/)
		{
			# Expect:
			# o 'widthxheight{+distance{%}}' for 'mean_shift'.

			$result = "$1 x $2 optional_plus_$3 optional_percent";
		}
		elsif ($token =~ /^\{\+_}([a-zA-Z]+)\{\+_}([a-zA-Z]+)$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o '{+_}tx{+_}ty' for 'annotate'.
			# o '{+_}x{+_}y' for 'floodfill' and 'roll'.

			$result = "plus_or_minus $1 plus_or_minus $2";
		}
		elsif ($token =~ /^([a-zA-Z]+)\{%}$/)
		{
			# Expect:
			# o 'value{%}' for 'bias'.

			$result = "$1 optional_percent";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)\{\+([_a-zA-Z]+)}\{\+([_a-zA-Z]+)}$/)
		{
			# Expect:
			# o 'radiusxsigma{+lower_percent}{+upper_percent}' for 'canny'.

			$result = "$1 x $2 optional_$3 optional_$4";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)\{\+([_a-zA-Z]+)}$/)
		{
			# Expect:
			# o 'widthxheight{+threshold}' for 'hough_lines'.

			$result = "$1 x $2 optional_$3";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)\{\+_}([_a-zA-Z]+)\{%}$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o 'widthxheight{+_}offset{%}' for 'lat'.

			$result = "$1 x $2 plus_or_minus $3 optional_percent";
		}
		elsif ($token =~ /^([_a-zA-Z]+)\{,([_a-zA-Z]+)}\{%}\{,([_a-zA-Z]+)}$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o 'black_point{,white_point}{%}{,gamma}' for 'level'.

			$result = "$1 optional_percent optional_comma_$2 optional_percent optional_comma_$3";
		}
		elsif ($token =~ /^\{([_a-zA-Z]+)}\{,}\{([_a-zA-Z]+)}$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o '{black_color}{,}{white_color}' for 'level_colors'.

			$result = "$1 comma $2";
		}
		elsif ($token =~ /^([_a-zA-Z]+)\{x([_a-zA-Z]+)}\{%}}$/)
		{
			# Warning: Fake '}}' instead of '}' at end of regexp.
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o 'brightness{xcontrast}{%}' for 'brightness_contrast'.
			# o 'black_point{xwhite_point}{%}' for 'contrast_stretch'.

			$result = "$1 optional_percent optional_x_$2 optional_percent";
		}
		elsif ($token =~ /^([_a-zA-Z]+)\{x([a-zA-Z]+)}(?:\{\+_})([a-zA-Z]+)(?:\{\+_})([a-zA-Z]+)\{%}$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o 'percent_opacity{xsigma}{+_}x{+_}y{%}' for 'shadow'.
			# o 'radius{xsigma}{+_}x{+_}y{%}' for 'vignette'.

			$result = "$1 optional_x_$2 plus_or_minus $3 plus_or_minus $4 optional_percent";
		}
		elsif ($token =~ /^([a-zA-Z]+)\{@}\{!}$/)
		{
			# Expect:
			# o 'geometry{@}{!}' for 'crop'.

			$result = "$1 optional_at_sign optional_exclamation_point";
		}
		else
		{
			$result = $token;
		}

		say "1 !$option! !$token! !$result!" if ($result =~ /$debug_target/);

		push @lexeme, $result;
	}

	return [@lexeme];

} # End of build_parameters.

# ----------------------------------------------

sub format_bnf
{
	my($bnf, $lexemes, $option_name, $debug_target)	= @_;
	my($max_length)									= 0;

	my(%seen);

	for my $value (values %$lexemes)
	{
		for my $lexeme (@$value)
		{
			for my $token (split(/\s/, $lexeme) )
			{
				if (! $seen{$lexeme})
				{
					say "2 !$lexeme! !$token!" if ($token =~ /$debug_target/);

					$seen{$token}	= 1;
					$max_length		= length($token) if (length($token) > $max_length);
				}
			}
		}
	}

	my(%definition_1) =
	(
		amount									=> 'comma_separated_integers',
		amplitude								=> 'real_number',
		angle									=> 'real_number',
		azimuth									=> 'real_number',
		black_color								=> 'color',
		black_point								=> 'string',
		brightness								=> 'real_number',
		brightness_optional_saturation_hue		=> 'real_number',
		cluster_threshold						=> 'integer',
		color									=> 'string',
		colorspace								=> 'color_space_list',
		comma									=> "','",
		command									=> 'string',
		components								=> 'color_prefix_list',
		connectivity							=> 'integer',
		contrast								=> 'integer',
		count									=> 'integer',
		degrees									=> 'real_number',
		distance								=> 'string',
		elevation								=> 'real_number',
		epsilon									=> 'real_number',
		events									=> 'comma_separated_events',
		expression								=> 'string',
		factor									=> 'real_number',
		filename								=> 'string',
		fontFamily								=> 'string',
		fontStretch								=> 'string',
		fontStyle								=> 'string',
		fontWeight								=> 'string',
		frames									=> 'integer',
		function								=> 'string',
		geometry								=> 'geometry_string',
		height									=> 'real_number',
		high									=> 'real_number',
		horizontal								=> 'integer',
		horizontal_factor						=> 'integer',
		horizontal_scale						=> 'integer',
		host_display_optional_dot_screen		=> 'string',
		id										=> 'string',
		image									=> 'string',
		index									=> 'image_list',
		indexes									=> 'image_list',
		iterations								=> 'integer',
		kernel									=> 'comma_separated_reals',
		key										=> 'string',
		levels									=> 'comma_separated_integers',
		low										=> 'real_number',
		matrix									=> 'string',
		media									=> 'string',
		method									=> 'string',
		mid_point								=> 'integer',
		name									=> 'string',
		offset									=> 'offset_list',
		operator								=> 'string',
		optional_at_sign						=> "'\@'",
		optional_comma_gamma					=> 'string',
		optional_comma_white_point				=> 'string',
		optional_x_dst_percent					=> 'real_number',
		optional_exclamation_point				=> "'!'",
		optional_gain							=> 'string',
		optional_geometry_suffix				=> 'string',
		optional_greater_than					=> "'>'",
		optional_less_or_greater_than			=> "'<'",
		optional_lower_percent					=> 'string',
		optional_offset							=> 'string',
		optional_percent						=> "'%'",
		optional_plus_distance					=> 'string',
		optional_plus_offset					=> 'string',
		optional_plus_y							=> "'+'",
		optional_threshold						=> 'string',
		optional_upper_percent					=> 'string',
		optional_x_contrast						=> 'string',
		optional_x_height						=> 'string',
		optional_x_height_optional_plus_angle	=> 'string',
		optional_x_sigma						=> 'string',
		optional_x_white_point					=> 'string',
		optional_x_Ydegrees						=> 'real_number',
		orientation								=> 'string',
		parameters								=> 'string',
		password								=> 'string',
		path									=> 'string',
		percent_opacity							=> 'real_number',
		plus									=> "'+'",
		plus_or_minus							=> '[+-]',
		port									=> 'integer',
		profile_name							=> 'string',
		radius									=> 'real_number',
		saturation								=> 'real_number',
		seconds									=> 'integer',
		sigma									=> 'real_number',
		smoothing_threshold						=> 'real_number',
		src_percent								=> 'real_number',
		string									=> '[[:print:]]',
		sx_rx_ry_sy_optional_tx_ty				=> 'comma_separated_reals',
		text									=> 'string',
		thickness								=> 'integer',
		threshold								=> 'real_number',
		ticks									=> 'integer',
		ticks_per_second						=> 'integer',
		tx										=> 'real_number',
		ty										=> 'real_number',
		type									=> 'string',
		value									=> 'string',
		vertical								=> 'integer',
		vertical_factor							=> 'real_number',
		vertical_scale							=> 'integer',
		wavelength								=> 'real_number',
		white_color								=> 'color',
		width									=> 'real_number',
		x										=> 'integer',
		Xdegrees								=> 'real_number',
		y										=> 'integer',
		Ydegrees								=> 'real_number',
	);
	my($total_tabs) = ($max_length / 4) + ($max_length % 4 == 0 ? 1 : 2);

	push @$bnf, '# L0 lexemes from ImageMagick command options.', '';

	my(%check);
	my($spacer);
	my($token_length, $tab_count);

	for my $lexeme (sort{lc $a cmp lc $b} keys %seen)
	{
		die "Unknown lexeme '$lexeme'\n" if (! $definition_1{$lexeme});

		$check{$lexeme}	= $definition_1{$lexeme};
		$token_length	= length($lexeme);
		$tab_count		= ($token_length / 4) + 1;
		$spacer			= "\t" x ($total_tabs - $tab_count);

		say "3 !$lexeme! !$definition_1{$lexeme}!" if ($definition_1{$lexeme} =~ /$debug_target/);

		push @$bnf, "$lexeme$spacer~ $definition_1{$lexeme}\n";
	}

	# Cross-check, looking for junk left over in %definition_1;

	for my $lexeme (sort keys %definition_1)
	{
		die "Delete $lexeme from %definition_1\n" if (! $check{$lexeme});
	}

	my(%definition_2)	=
	(
		color_prefix_list			=> 'string',
		color_space_list			=> 'string',
		comma_separated_events		=> 'string',
		comma_separated_integers	=> 'string',
		comma_separated_reals		=> 'string',
		geometry_string				=> 'string',
		image_list					=> 'string',
		integer						=> '[\d]+',
		offset_list					=> 'string',
		image_list					=> 'string',
		minus_sign					=> "'-'",
		real_number					=> 'string',
	);

	push @$bnf, '# L0 lexemes from option parameters.', '';

	for my $lexeme (sort keys %definition_2)
	{
		$token_length	= length($lexeme);
		$tab_count		= ($token_length / 4) + 1;
		$spacer			= "\t" x ($total_tabs - $tab_count);

		push @$bnf, "$lexeme$spacer~ $definition_2{$lexeme}\n";
	}

	push @$bnf, '# L0 lexemes from ImageMagick command names.', '';

	my($token);

	for my $lexeme (qw/convert identify mogrify/)
	{
		$token			= "${lexeme}_name";
		$token_length	= length($token);
		$tab_count		= ($token_length / 4) + 1;
		$spacer			= "\t" x ($total_tabs - $tab_count);

		push @$bnf, "$token$spacer~ '$lexeme'\n";
	}

	push @$bnf, '# L0 lexemes from option names.', '';

	for my $lexeme (@$option_name)
	{
		$token_length	= length($lexeme);
		$tab_count		= ($token_length / 4) + 1;
		$spacer			= "\t" x ($total_tabs - $tab_count);

		push @$bnf, "$lexeme$spacer~ '$lexeme'\n";
	}

	$spacer = "\t" x ($total_tabs - $tab_count - 1);

	push @$bnf, <<"EOS";
# L0 lexemes for the boilerplate.

# \\x{09} => \\t. \\x{0A} => \\n. \\x{0D} => \\r. \\x{20} => \\s.

:discard$spacer~ whitespace
whitespace$spacer~ [\\s]+
EOS

	save_bnf($bnf);

} # End of format_bnf.

# ----------------------------------------------

sub generate_action_subs
{
	my($actions)	= @_;
	my($code)		= <<'EOS';
package Image::Magick::CommandParser::Actions;

use strict;
use warnings;

# Warning: Do not use Moo or anything similar.
# This class needs a sub new() due to the way
# Marpa calls the constructor.

our $VERSION = '1.00';

EOS

	my($done_new);

	for my $action (sort keys %$actions)
	{
		if (! $done_new && ($action gt 'new') )
		{
			$done_new	= 1;
			$code		.= <<"EOS";
# ------------------------------------------------

sub new
{
	my(\$class) = \@_;

	return bless \{}, \$class;

} # End of new.

EOS
		}

		$code .= <<"EOS";
# ------------------------------------------------

sub $action
{
	my(\$cache, \@param) = \@_;

	return \$param[0];

} # End of $action.

EOS
	}

	$code .=<<"EOS";
# ------------------------------------------------

1;

=pod

=head1 NAME

C<Image::Magick::CommandParser::Actions> - Parse any command line used by ImageMagick

=head1 Synopsis

See L<Image::Magick::CommandParser/Synopsis>.

The module is used automatically by L<Image::Magick::CommandParser> as appropriate.

=head1 Description

See L<Image::Magick::CommandParser/Description>.

=head1 Installation

See L<Image::Magick::CommandParser/Installation>.

=head1 Methods

The functions are called automatically by L<Marpa::R2> as appropriate.

=head2 new()

The constructor is called automatically by L<Marpa::R2> as appropriate.

=head1 Machine-Readable Change Log

The file Changes was converted into Changelog.ini by L<Module::Metadata::Changes>.

=head1 Version Numbers

Version numbers < 1.00 represent development versions. From 1.00 up, they are production versions.

=head1 Support

Email the author, or log a bug on RT:

L<https://rt.cpan.org/Public/Dist/Display.html?Name=Image::Magick::CommandParser>.

=head1 Author

Ron Savage I<E<lt>ron\@savage.net.auE<gt>>.

Home page: L<http://savage.net.au/>.

=head1 Copyright

Australian copyright (c) 2016, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Artistic License 2.0, a copy of which is available at:
	http://www.opensource.org/licenses/index.html

=cut
EOS

	my($output_file) = 'lib/Image/Magick/CommandParser/Actions.pm';

	open(my $fh, '>', $output_file) || die "Unable to open(> $output_file)\n";

	print $fh $code;

	close $fh;

} # End of generate_action_subs.

# ----------------------------------------------

sub process_html
{
	my($input_file)	= 'data/command.line.options.html';
	my($root)		= HTML::TreeBuilder -> new();
	my $content		= join(' ', read_lines($input_file) );

	decode_entities $content;

	my($result)		= $root -> parse_content($content);
	my(@h3)			= $root -> look_down(_tag => 'h3');
	my($count)		= 0;

	my($command);
	my(@field);
	my($line);
	my($name);
	my($parameters);
	my($sign, $s);

	for my $h3 (@h3)
	{
		$count++;

		$line	= $h3 -> as_text || '-';
		$line	=~ tr/ //s;
		$s		= $line =~ s/^\s+//r;
		$s		=~ s/\s+$//;

		if ($s =~ /^(-|\+)([^\s]+)\s*(.*)/)
		{
			$sign		= $1;
			$name		= $2;
			$parameters	= $3;
			$name		=~ s/-/_/g;
			$parameters	=~ s/-/_/g;

			# Abandon some cases.

			next if ($name =~ /define|distort|morphology|ordered_dither|poly|sparse_color/);

			@field = split(/((?:_|\+)$name)/, $parameters);

			if ($#field == 0)
			{
				push @$command,
					{
						name		=> $name,
						parameters	=> $parameters,
						sign		=> $sign,
					};
			}
			else
			{
				while ($parameters = shift @field)
				{
					$parameters =~ s/^\s+//;
					$parameters =~ s/\s+$//;

					push @$command,
						{
							name		=> $name,
							parameters	=> $parameters,
							sign		=> $sign,
						};

					$name = shift @field;

					if ($name)
					{
						$sign				= substr($name, 0, 1);
						substr($name, 0, 1)	= '';
					}
				}

				push @$command,
					{
						name		=> $name,
						parameters	=> '',
						sign		=> $sign,
					} if ($name);
			}
		}
		else
		{
			die "Unable to find prefix and command: $line";
		}
	}

	$root -> delete();

	save_raw_commands($command);

	return $command;

} # End of process_html.

# ----------------------------------------------

sub save_bnf
{
	my($bnf)			= @_;
	my($output_file)	= 'data/command.line.options.bnf';

	open(my $fh, '>', $output_file) || die "Can't open(> $output_file): $!";

	for (@$bnf)
	{
		say $fh $_;
	}

	close $fh;

} # End of save_bnf.

# ----------------------------------------------

sub save_raw_commands
{
	my($command)		= @_;
	my($output_file)	= 'data/command.line.options.raw';
	my($max_length)		= 0;

	my($lexeme);

	for my $item (@$command)
	{
		$lexeme		= $$item{name};
		$max_length = length($lexeme) if (length($lexeme) > $max_length);
	}

	my($total_tabs) = ($max_length / 4) + ($max_length % 4 == 0 ? 1 : 2);

	my($spacer);
	my($token_length, $tab_count);

	open(my $fh, '>', $output_file) || die "Can't open(> $output_file): $!";

	for my $item (@$command)
	{
		$lexeme			= $$item{name};
		$token_length	= length($lexeme);
		$tab_count		= ($token_length / 4);
		$spacer			= "\t" x ($total_tabs - $tab_count - 1);

		say $fh "$lexeme$spacer\t$$item{sign}\t$$item{parameters}";
	}

	close $fh;

} # End of save_raw_commands.

# ----------------------------------------------

my($debug_target)							= shift || 'Enter option value';
my($command)								= process_html;
my($bnf, $lexemes, $option_name, $actions)	= build_bnf($debug_target, $command);

format_bnf($bnf, $lexemes, $option_name, $debug_target);

generate_action_subs($actions);
