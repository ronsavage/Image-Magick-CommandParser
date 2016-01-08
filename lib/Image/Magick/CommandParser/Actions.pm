package Image::Magick::CommandParser::Actions;

use strict;
use warnings;

# Warning: Do not use Moo or anything similar.
# This class needs a sub new() due to the way
# Marpa calls the constructor.

our $VERSION = '1.00';

# ------------------------------------------------

sub adaptive_blur_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'adaptive_blur_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'adaptive',
	});

	return $params[0];

} # End of adaptive_blur_1.

# ------------------------------------------------

sub adaptive_resize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'adaptive_resize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'adaptive',
	});

	return $params[0];

} # End of adaptive_resize_1.

# ------------------------------------------------

sub adaptive_sharpen_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'adaptive_sharpen_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'adaptive',
	});

	return $params[0];

} # End of adaptive_sharpen_1.

# ------------------------------------------------

sub adjoin_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'adjoin_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'adjoin',
	});

	return $params[0];

} # End of adjoin_1.

# ------------------------------------------------

sub affine_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'affine_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'affine',
	});

	return $params[0];

} # End of affine_1.

# ------------------------------------------------

sub alpha_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'alpha_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'alpha',
	});

	return $params[0];

} # End of alpha_1.

# ------------------------------------------------

sub annotate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'annotate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'annotate',
	});

	return $params[0];

} # End of annotate_1.

# ------------------------------------------------

sub annotate_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'annotate_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'annotate',
	});

	return $params[0];

} # End of annotate_2.

# ------------------------------------------------

sub annotate_3
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'annotate_3');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'annotate',
	});

	return $params[0];

} # End of annotate_3.

# ------------------------------------------------

sub annotate_4
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'annotate_4');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'annotate',
	});

	return $params[0];

} # End of annotate_4.

# ------------------------------------------------

sub antialias_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'antialias_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'antialias',
	});

	return $params[0];

} # End of antialias_1.

# ------------------------------------------------

sub append_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'append_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'append',
	});

	return $params[0];

} # End of append_1.

# ------------------------------------------------

sub attenuate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'attenuate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'attenuate',
	});

	return $params[0];

} # End of attenuate_1.

# ------------------------------------------------

sub authenticate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'authenticate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'authenticate',
	});

	return $params[0];

} # End of authenticate_1.

# ------------------------------------------------

sub auto_gamma_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'auto_gamma_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'auto',
	});

	return $params[0];

} # End of auto_gamma_1.

# ------------------------------------------------

sub auto_level_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'auto_level_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'auto',
	});

	return $params[0];

} # End of auto_level_1.

# ------------------------------------------------

sub auto_orient_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'auto_orient_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'auto',
	});

	return $params[0];

} # End of auto_orient_1.

# ------------------------------------------------

sub average_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'average_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'average',
	});

	return $params[0];

} # End of average_1.

# ------------------------------------------------

sub backdrop_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'backdrop_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'backdrop',
	});

	return $params[0];

} # End of backdrop_1.

# ------------------------------------------------

sub background_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'background_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'background',
	});

	return $params[0];

} # End of background_1.

# ------------------------------------------------

sub bench_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'bench_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'bench',
	});

	return $params[0];

} # End of bench_1.

# ------------------------------------------------

sub bias_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'bias_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'bias',
	});

	return $params[0];

} # End of bias_1.

# ------------------------------------------------

sub black_point_compensation_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'black_point_compensation_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'black',
	});

	return $params[0];

} # End of black_point_compensation_1.

# ------------------------------------------------

sub black_threshold_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'black_threshold_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'black',
	});

	return $params[0];

} # End of black_threshold_1.

# ------------------------------------------------

sub blend_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blend_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blend',
	});

	return $params[0];

} # End of blend_1.

# ------------------------------------------------

sub blue_primary_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blue_primary_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blue',
	});

	return $params[0];

} # End of blue_primary_1.

# ------------------------------------------------

sub blue_shift_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blue_shift_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blue',
	});

	return $params[0];

} # End of blue_shift_1.

# ------------------------------------------------

sub blur_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blur_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blur',
	});

	return $params[0];

} # End of blur_1.

# ------------------------------------------------

sub blur_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blur_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blur',
	});

	return $params[0];

} # End of blur_2.

# ------------------------------------------------

sub blur_3
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blur_3');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blur',
	});

	return $params[0];

} # End of blur_3.

# ------------------------------------------------

sub border_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'border_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'border',
	});

	return $params[0];

} # End of border_1.

# ------------------------------------------------

sub bordercolor_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'bordercolor_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'bordercolor',
	});

	return $params[0];

} # End of bordercolor_1.

# ------------------------------------------------

sub borderwidth_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'borderwidth_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'borderwidth',
	});

	return $params[0];

} # End of borderwidth_1.

# ------------------------------------------------

sub brightness_contrast_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'brightness_contrast_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'brightness',
	});

	return $params[0];

} # End of brightness_contrast_1.

# ------------------------------------------------

sub brightness_contrast_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'brightness_contrast_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'brightness',
	});

	return $params[0];

} # End of brightness_contrast_2.

# ------------------------------------------------

sub cache_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'cache_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'cache',
	});

	return $params[0];

} # End of cache_1.

# ------------------------------------------------

sub canny_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'canny_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'canny',
	});

	return $params[0];

} # End of canny_1.

# ------------------------------------------------

sub canny_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'canny_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'canny',
	});

	return $params[0];

} # End of canny_2.

# ------------------------------------------------

sub caption_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'caption_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'caption',
	});

	return $params[0];

} # End of caption_1.

# ------------------------------------------------

sub cdl_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'cdl_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'cdl',
	});

	return $params[0];

} # End of cdl_1.

# ------------------------------------------------

sub channel_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'channel_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'channel',
	});

	return $params[0];

} # End of channel_1.

# ------------------------------------------------

sub charcoal_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'charcoal_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'charcoal',
	});

	return $params[0];

} # End of charcoal_1.

# ------------------------------------------------

sub chop_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'chop_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'chop',
	});

	return $params[0];

} # End of chop_1.

# ------------------------------------------------

sub clamp_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clamp_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clamp',
	});

	return $params[0];

} # End of clamp_1.

# ------------------------------------------------

sub clip_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clip_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clip',
	});

	return $params[0];

} # End of clip_1.

# ------------------------------------------------

sub clip_mask_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clip_mask_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clip',
	});

	return $params[0];

} # End of clip_mask_1.

# ------------------------------------------------

sub clip_path_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clip_path_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clip',
	});

	return $params[0];

} # End of clip_path_1.

# ------------------------------------------------

sub clone_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clone_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clone',
	});

	return $params[0];

} # End of clone_1.

# ------------------------------------------------

sub close_parenthesis
{
	my($cache, @params) = @_;

	$$cache{logger} -> log(debug => 'close_parenthesis');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params],
		sign	=> '',
		rule	=> 'close_parenthesis',
	});

	return $params[0];

} # End of close_parenthesis.

# ------------------------------------------------

sub clut_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clut_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clut',
	});

	return $params[0];

} # End of clut_1.

# ------------------------------------------------

sub coalesce_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'coalesce_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'coalesce',
	});

	return $params[0];

} # End of coalesce_1.

# ------------------------------------------------

sub color_matrix_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'color_matrix_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'color',
	});

	return $params[0];

} # End of color_matrix_1.

# ------------------------------------------------

sub colorize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'colorize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'colorize',
	});

	return $params[0];

} # End of colorize_1.

# ------------------------------------------------

sub colormap_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'colormap_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'colormap',
	});

	return $params[0];

} # End of colormap_1.

# ------------------------------------------------

sub colors_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'colors_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'colors',
	});

	return $params[0];

} # End of colors_1.

# ------------------------------------------------

sub colorspace_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'colorspace_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'colorspace',
	});

	return $params[0];

} # End of colorspace_1.

# ------------------------------------------------

sub combine_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'combine_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'combine',
	});

	return $params[0];

} # End of combine_1.

# ------------------------------------------------

sub command
{
	my($cache, @params) = @_;

	$$cache{logger} -> log(debug => 'command');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params],
		sign	=> '',
		rule	=> 'command',
	});

	return $params[0];

} # End of command.

# ------------------------------------------------

sub comment_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'comment_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'comment',
	});

	return $params[0];

} # End of comment_1.

# ------------------------------------------------

sub compare_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'compare_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'compare',
	});

	return $params[0];

} # End of compare_1.

# ------------------------------------------------

sub complex_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'complex_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'complex',
	});

	return $params[0];

} # End of complex_1.

# ------------------------------------------------

sub compose_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'compose_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'compose',
	});

	return $params[0];

} # End of compose_1.

# ------------------------------------------------

sub composite_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'composite_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'composite',
	});

	return $params[0];

} # End of composite_1.

# ------------------------------------------------

sub compress_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'compress_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'compress',
	});

	return $params[0];

} # End of compress_1.

# ------------------------------------------------

sub connected_components_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'connected_components_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'connected',
	});

	return $params[0];

} # End of connected_components_1.

# ------------------------------------------------

sub contrast_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'contrast_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'contrast',
	});

	return $params[0];

} # End of contrast_1.

# ------------------------------------------------

sub contrast_stretch_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'contrast_stretch_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'contrast',
	});

	return $params[0];

} # End of contrast_stretch_1.

# ------------------------------------------------

sub contrast_stretch_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'contrast_stretch_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'contrast',
	});

	return $params[0];

} # End of contrast_stretch_2.

# ------------------------------------------------

sub convolve_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'convolve_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'convolve',
	});

	return $params[0];

} # End of convolve_1.

# ------------------------------------------------

sub copy_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'copy_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'copy',
	});

	return $params[0];

} # End of copy_1.

# ------------------------------------------------

sub crop_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'crop_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'crop',
	});

	return $params[0];

} # End of crop_1.

# ------------------------------------------------

sub cycle_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'cycle_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'cycle',
	});

	return $params[0];

} # End of cycle_1.

# ------------------------------------------------

sub debug_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'debug_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'debug',
	});

	return $params[0];

} # End of debug_1.

# ------------------------------------------------

sub decipher_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'decipher_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'decipher',
	});

	return $params[0];

} # End of decipher_1.

# ------------------------------------------------

sub decode_result
{
	my($cache, $result)	= @_;
	my(@worklist)			= $result;

	my($obj);
	my($ref_type);
	my(@stack);

	do
	{
		$obj		= shift @worklist;
		$ref_type	= ref $obj;

		if ($ref_type eq 'ARRAY')
		{
			unshift @worklist, @$obj;
		}
		elsif ($ref_type eq 'HASH')
		{
			push @stack, {%$obj};
		}
		else
		{
			die "Unsupported object type $ref_type\n" if ($ref_type);
		}
	} while (@worklist);

	$$cache{self} -> log(debug => "Returning stack of length @{[scalar @stack]}");

	return [@stack];

} # End of decode_result.

# ------------------------------------------------

sub deconstruct_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'deconstruct_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'deconstruct',
	});

	return $params[0];

} # End of deconstruct_1.

# ------------------------------------------------

sub delay_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'delay_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'delay',
	});

	return $params[0];

} # End of delay_1.

# ------------------------------------------------

sub delay_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'delay_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'delay',
	});

	return $params[0];

} # End of delay_2.

# ------------------------------------------------

sub delete_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'delete_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'delete',
	});

	return $params[0];

} # End of delete_1.

# ------------------------------------------------

sub density_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'density_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'density',
	});

	return $params[0];

} # End of density_1.

# ------------------------------------------------

sub density_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'density_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'density',
	});

	return $params[0];

} # End of density_2.

# ------------------------------------------------

sub depth_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'depth_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'depth',
	});

	return $params[0];

} # End of depth_1.

# ------------------------------------------------

sub descend_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'descend_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'descend',
	});

	return $params[0];

} # End of descend_1.

# ------------------------------------------------

sub deskew_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'deskew_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'deskew',
	});

	return $params[0];

} # End of deskew_1.

# ------------------------------------------------

sub despeckle_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'despeckle_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'despeckle',
	});

	return $params[0];

} # End of despeckle_1.

# ------------------------------------------------

sub direction_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'direction_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'direction',
	});

	return $params[0];

} # End of direction_1.

# ------------------------------------------------

sub displace_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'displace_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'displace',
	});

	return $params[0];

} # End of displace_1.

# ------------------------------------------------

sub displace_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'displace_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'displace',
	});

	return $params[0];

} # End of displace_2.

# ------------------------------------------------

sub display_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'display_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'display',
	});

	return $params[0];

} # End of display_1.

# ------------------------------------------------

sub dispose_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'dispose_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'dispose',
	});

	return $params[0];

} # End of dispose_1.

# ------------------------------------------------

sub dissimilarity_threshold_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'dissimilarity_threshold_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'dissimilarity',
	});

	return $params[0];

} # End of dissimilarity_threshold_1.

# ------------------------------------------------

sub dissolve_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'dissolve_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'dissolve',
	});

	return $params[0];

} # End of dissolve_1.

# ------------------------------------------------

sub distribute_cache_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'distribute_cache_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'distribute',
	});

	return $params[0];

} # End of distribute_cache_1.

# ------------------------------------------------

sub dither_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'dither_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'dither',
	});

	return $params[0];

} # End of dither_1.

# ------------------------------------------------

sub draw_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'draw_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'draw',
	});

	return $params[0];

} # End of draw_1.

# ------------------------------------------------

sub duplicate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'duplicate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'duplicate',
	});

	return $params[0];

} # End of duplicate_1.

# ------------------------------------------------

sub edge_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'edge_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'edge',
	});

	return $params[0];

} # End of edge_1.

# ------------------------------------------------

sub emboss_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'emboss_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'emboss',
	});

	return $params[0];

} # End of emboss_1.

# ------------------------------------------------

sub encipher_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'encipher_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'encipher',
	});

	return $params[0];

} # End of encipher_1.

# ------------------------------------------------

sub encoding_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'encoding_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'encoding',
	});

	return $params[0];

} # End of encoding_1.

# ------------------------------------------------

sub endian_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'endian_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'endian',
	});

	return $params[0];

} # End of endian_1.

# ------------------------------------------------

sub enhance_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'enhance_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'enhance',
	});

	return $params[0];

} # End of enhance_1.

# ------------------------------------------------

sub equalize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'equalize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'equalize',
	});

	return $params[0];

} # End of equalize_1.

# ------------------------------------------------

sub evaluate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'evaluate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'evaluate',
	});

	return $params[0];

} # End of evaluate_1.

# ------------------------------------------------

sub evaluate_sequence_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'evaluate_sequence_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'evaluate',
	});

	return $params[0];

} # End of evaluate_sequence_1.

# ------------------------------------------------

sub extent_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'extent_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'extent',
	});

	return $params[0];

} # End of extent_1.

# ------------------------------------------------

sub extract_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'extract_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'extract',
	});

	return $params[0];

} # End of extract_1.

# ------------------------------------------------

sub family_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'family_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'family',
	});

	return $params[0];

} # End of family_1.

# ------------------------------------------------

sub features_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'features_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'features',
	});

	return $params[0];

} # End of features_1.

# ------------------------------------------------

sub fft_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'fft_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'fft',
	});

	return $params[0];

} # End of fft_1.

# ------------------------------------------------

sub fill_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'fill_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'fill',
	});

	return $params[0];

} # End of fill_1.

# ------------------------------------------------

sub filter_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'filter_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'filter',
	});

	return $params[0];

} # End of filter_1.

# ------------------------------------------------

sub flatten_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'flatten_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'flatten',
	});

	return $params[0];

} # End of flatten_1.

# ------------------------------------------------

sub flip_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'flip_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'flip',
	});

	return $params[0];

} # End of flip_1.

# ------------------------------------------------

sub floodfill_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'floodfill_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'floodfill',
	});

	return $params[0];

} # End of floodfill_1.

# ------------------------------------------------

sub flop_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'flop_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'flop',
	});

	return $params[0];

} # End of flop_1.

# ------------------------------------------------

sub font_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'font_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'font',
	});

	return $params[0];

} # End of font_1.

# ------------------------------------------------

sub foreground_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'foreground_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'foreground',
	});

	return $params[0];

} # End of foreground_1.

# ------------------------------------------------

sub format_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'format_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'format',
	});

	return $params[0];

} # End of format_1.

# ------------------------------------------------

sub format_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'format_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'format',
	});

	return $params[0];

} # End of format_2.

# ------------------------------------------------

sub frame_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'frame_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'frame',
	});

	return $params[0];

} # End of frame_1.

# ------------------------------------------------

sub frame_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'frame_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'frame',
	});

	return $params[0];

} # End of frame_2.

# ------------------------------------------------

sub function_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'function_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'function',
	});

	return $params[0];

} # End of function_1.

# ------------------------------------------------

sub fuzz_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'fuzz_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'fuzz',
	});

	return $params[0];

} # End of fuzz_1.

# ------------------------------------------------

sub fx_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'fx_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'fx',
	});

	return $params[0];

} # End of fx_1.

# ------------------------------------------------

sub gamma_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'gamma_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'gamma',
	});

	return $params[0];

} # End of gamma_1.

# ------------------------------------------------

sub gaussian_blur_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'gaussian_blur_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'gaussian',
	});

	return $params[0];

} # End of gaussian_blur_1.

# ------------------------------------------------

sub gaussian_blur_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'gaussian_blur_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'gaussian',
	});

	return $params[0];

} # End of gaussian_blur_2.

# ------------------------------------------------

sub geometry_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'geometry_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'geometry',
	});

	return $params[0];

} # End of geometry_1.

# ------------------------------------------------

sub gravity_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'gravity_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'gravity',
	});

	return $params[0];

} # End of gravity_1.

# ------------------------------------------------

sub grayscale_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'grayscale_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'grayscale',
	});

	return $params[0];

} # End of grayscale_1.

# ------------------------------------------------

sub green_primary_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'green_primary_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'green',
	});

	return $params[0];

} # End of green_primary_1.

# ------------------------------------------------

sub hald_clut_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'hald_clut_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'hald',
	});

	return $params[0];

} # End of hald_clut_1.

# ------------------------------------------------

sub help_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'help_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'help',
	});

	return $params[0];

} # End of help_1.

# ------------------------------------------------

sub highlight_color_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'highlight_color_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'highlight',
	});

	return $params[0];

} # End of highlight_color_1.

# ------------------------------------------------

sub hough_lines_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'hough_lines_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'hough',
	});

	return $params[0];

} # End of hough_lines_1.

# ------------------------------------------------

sub iconGeometry_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'iconGeometry_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'iconGeometry',
	});

	return $params[0];

} # End of iconGeometry_1.

# ------------------------------------------------

sub iconic_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'iconic_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'iconic',
	});

	return $params[0];

} # End of iconic_1.

# ------------------------------------------------

sub identify_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'identify_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'identify',
	});

	return $params[0];

} # End of identify_1.

# ------------------------------------------------

sub ift_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'ift_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'ift',
	});

	return $params[0];

} # End of ift_1.

# ------------------------------------------------

sub immutable_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'immutable_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'immutable',
	});

	return $params[0];

} # End of immutable_1.

# ------------------------------------------------

sub implode_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'implode_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'implode',
	});

	return $params[0];

} # End of implode_1.

# ------------------------------------------------

sub input_file
{
	my($cache, @params) = @_;

	$$cache{logger} -> log(debug => 'input_file');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params],
		sign	=> '',
		rule	=> 'input_file',
	});

	return $params[0];

} # End of input_file.

# ------------------------------------------------

sub insert_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'insert_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'insert',
	});

	return $params[0];

} # End of insert_1.

# ------------------------------------------------

sub intensity_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'intensity_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'intensity',
	});

	return $params[0];

} # End of intensity_1.

# ------------------------------------------------

sub intent_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'intent_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'intent',
	});

	return $params[0];

} # End of intent_1.

# ------------------------------------------------

sub interlace_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'interlace_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'interlace',
	});

	return $params[0];

} # End of interlace_1.

# ------------------------------------------------

sub interline_spacing_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'interline_spacing_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'interline',
	});

	return $params[0];

} # End of interline_spacing_1.

# ------------------------------------------------

sub interpolate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'interpolate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'interpolate',
	});

	return $params[0];

} # End of interpolate_1.

# ------------------------------------------------

sub interword_spacing_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'interword_spacing_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'interword',
	});

	return $params[0];

} # End of interword_spacing_1.

# ------------------------------------------------

sub kerning_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'kerning_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'kerning',
	});

	return $params[0];

} # End of kerning_1.

# ------------------------------------------------

sub kuwahara_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'kuwahara_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'kuwahara',
	});

	return $params[0];

} # End of kuwahara_1.

# ------------------------------------------------

sub kuwahara_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'kuwahara_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'kuwahara',
	});

	return $params[0];

} # End of kuwahara_2.

# ------------------------------------------------

sub label_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'label_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'label',
	});

	return $params[0];

} # End of label_1.

# ------------------------------------------------

sub lat_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'lat_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'lat',
	});

	return $params[0];

} # End of lat_1.

# ------------------------------------------------

sub lat_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'lat_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'lat',
	});

	return $params[0];

} # End of lat_2.

# ------------------------------------------------

sub layers_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'layers_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'layers',
	});

	return $params[0];

} # End of layers_1.

# ------------------------------------------------

sub level_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'level_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'level',
	});

	return $params[0];

} # End of level_1.

# ------------------------------------------------

sub level_colors_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'level_colors_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'level',
	});

	return $params[0];

} # End of level_colors_1.

# ------------------------------------------------

sub limit_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'limit_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'limit',
	});

	return $params[0];

} # End of limit_1.

# ------------------------------------------------

sub linear_stretch_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'linear_stretch_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'linear',
	});

	return $params[0];

} # End of linear_stretch_1.

# ------------------------------------------------

sub linear_stretch_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'linear_stretch_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'linear',
	});

	return $params[0];

} # End of linear_stretch_2.

# ------------------------------------------------

sub linewidth_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'linewidth_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'linewidth',
	});

	return $params[0];

} # End of linewidth_1.

# ------------------------------------------------

sub liquid_rescale_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'liquid_rescale_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'liquid',
	});

	return $params[0];

} # End of liquid_rescale_1.

# ------------------------------------------------

sub list_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'list_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'list',
	});

	return $params[0];

} # End of list_1.

# ------------------------------------------------

sub log_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'log_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'log',
	});

	return $params[0];

} # End of log_1.

# ------------------------------------------------

sub loop_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'loop_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'loop',
	});

	return $params[0];

} # End of loop_1.

# ------------------------------------------------

sub lowlight_color_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'lowlight_color_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'lowlight',
	});

	return $params[0];

} # End of lowlight_color_1.

# ------------------------------------------------

sub magnify_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'magnify_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'magnify',
	});

	return $params[0];

} # End of magnify_1.

# ------------------------------------------------

sub map_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'map_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'map',
	});

	return $params[0];

} # End of map_1.

# ------------------------------------------------

sub map_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'map_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'map',
	});

	return $params[0];

} # End of map_2.

# ------------------------------------------------

sub mask_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mask_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mask',
	});

	return $params[0];

} # End of mask_1.

# ------------------------------------------------

sub mattecolor_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mattecolor_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mattecolor',
	});

	return $params[0];

} # End of mattecolor_1.

# ------------------------------------------------

sub maximum_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'maximum_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'maximum',
	});

	return $params[0];

} # End of maximum_1.

# ------------------------------------------------

sub mean_shift_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mean_shift_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mean',
	});

	return $params[0];

} # End of mean_shift_1.

# ------------------------------------------------

sub median_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'median_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'median',
	});

	return $params[0];

} # End of median_1.

# ------------------------------------------------

sub metric_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'metric_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'metric',
	});

	return $params[0];

} # End of metric_1.

# ------------------------------------------------

sub minimum_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'minimum_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'minimum',
	});

	return $params[0];

} # End of minimum_1.

# ------------------------------------------------

sub mode_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mode_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mode',
	});

	return $params[0];

} # End of mode_1.

# ------------------------------------------------

sub mode_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mode_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mode',
	});

	return $params[0];

} # End of mode_2.

# ------------------------------------------------

sub modulate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'modulate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'modulate',
	});

	return $params[0];

} # End of modulate_1.

# ------------------------------------------------

sub moments_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'moments_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'moments',
	});

	return $params[0];

} # End of moments_1.

# ------------------------------------------------

sub monitor_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'monitor_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'monitor',
	});

	return $params[0];

} # End of monitor_1.

# ------------------------------------------------

sub monochrome_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'monochrome_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'monochrome',
	});

	return $params[0];

} # End of monochrome_1.

# ------------------------------------------------

sub morph_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'morph_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'morph',
	});

	return $params[0];

} # End of morph_1.

# ------------------------------------------------

sub mosaic_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mosaic_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mosaic',
	});

	return $params[0];

} # End of mosaic_1.

# ------------------------------------------------

sub motion_blur_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'motion_blur_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'motion',
	});

	return $params[0];

} # End of motion_blur_1.

# ------------------------------------------------

sub motion_blur_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'motion_blur_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'motion',
	});

	return $params[0];

} # End of motion_blur_2.

# ------------------------------------------------

sub name_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'name_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'name',
	});

	return $params[0];

} # End of name_1.

# ------------------------------------------------

sub negate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'negate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'negate',
	});

	return $params[0];

} # End of negate_1.

# ------------------------------------------------

sub new
{
	my($class) = @_;

	return bless {}, $class;

} # End of new.

# ------------------------------------------------

sub noise_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'noise_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'noise',
	});

	return $params[0];

} # End of noise_1.

# ------------------------------------------------

sub noise_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'noise_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'noise',
	});

	return $params[0];

} # End of noise_2.

# ------------------------------------------------

sub normalize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'normalize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'normalize',
	});

	return $params[0];

} # End of normalize_1.

# ------------------------------------------------

sub opaque_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'opaque_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'opaque',
	});

	return $params[0];

} # End of opaque_1.

# ------------------------------------------------

sub open_parenthesis
{
	my($cache, @params) = @_;

	$$cache{logger} -> log(debug => 'command');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params],
		sign	=> '',
		rule	=> 'open_parenthesis',
	});

	return $params[0];

} # End of open_parenthesis.

# ------------------------------------------------

sub orient_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'orient_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'orient',
	});

	return $params[0];

} # End of orient_1.

# ------------------------------------------------

sub page_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'page_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'page',
	});

	return $params[0];

} # End of page_1.

# ------------------------------------------------

sub page_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'page_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'page',
	});

	return $params[0];

} # End of page_2.

# ------------------------------------------------

sub page_3
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'page_3');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'page',
	});

	return $params[0];

} # End of page_3.

# ------------------------------------------------

sub paint_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'paint_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'paint',
	});

	return $params[0];

} # End of paint_1.

# ------------------------------------------------

sub path_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'path_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'path',
	});

	return $params[0];

} # End of path_1.

# ------------------------------------------------

sub pause_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'pause_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'pause',
	});

	return $params[0];

} # End of pause_1.

# ------------------------------------------------

sub pause_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'pause_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'pause',
	});

	return $params[0];

} # End of pause_2.

# ------------------------------------------------

sub perceptible_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'perceptible_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'perceptible',
	});

	return $params[0];

} # End of perceptible_1.

# ------------------------------------------------

sub ping_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'ping_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'ping',
	});

	return $params[0];

} # End of ping_1.

# ------------------------------------------------

sub pointsize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'pointsize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'pointsize',
	});

	return $params[0];

} # End of pointsize_1.

# ------------------------------------------------

sub polaroid_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'polaroid_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'polaroid',
	});

	return $params[0];

} # End of polaroid_1.

# ------------------------------------------------

sub posterize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'posterize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'posterize',
	});

	return $params[0];

} # End of posterize_1.

# ------------------------------------------------

sub precision_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'precision_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'precision',
	});

	return $params[0];

} # End of precision_1.

# ------------------------------------------------

sub preview_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'preview_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'preview',
	});

	return $params[0];

} # End of preview_1.

# ------------------------------------------------

sub print_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'print_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'print',
	});

	return $params[0];

} # End of print_1.

# ------------------------------------------------

sub process_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'process_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'process',
	});

	return $params[0];

} # End of process_1.

# ------------------------------------------------

sub profile_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'profile_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'profile',
	});

	return $params[0];

} # End of profile_1.

# ------------------------------------------------

sub profile_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'profile_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'profile',
	});

	return $params[0];

} # End of profile_2.

# ------------------------------------------------

sub quality_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'quality_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'quality',
	});

	return $params[0];

} # End of quality_1.

# ------------------------------------------------

sub quantize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'quantize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'quantize',
	});

	return $params[0];

} # End of quantize_1.

# ------------------------------------------------

sub quiet_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'quiet_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'quiet',
	});

	return $params[0];

} # End of quiet_1.

# ------------------------------------------------

sub radial_blur_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'radial_blur_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'radial',
	});

	return $params[0];

} # End of radial_blur_1.

# ------------------------------------------------

sub raise_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'raise_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'raise',
	});

	return $params[0];

} # End of raise_1.

# ------------------------------------------------

sub random_threshold_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'random_threshold_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'random',
	});

	return $params[0];

} # End of random_threshold_1.

# ------------------------------------------------

sub red_primary_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'red_primary_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'red',
	});

	return $params[0];

} # End of red_primary_1.

# ------------------------------------------------

sub regard_warnings_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'regard_warnings_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'regard',
	});

	return $params[0];

} # End of regard_warnings_1.

# ------------------------------------------------

sub region_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'region_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'region',
	});

	return $params[0];

} # End of region_1.

# ------------------------------------------------

sub remap_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'remap_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'remap',
	});

	return $params[0];

} # End of remap_1.

# ------------------------------------------------

sub remote_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'remote_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'remote',
	});

	return $params[0];

} # End of remote_1.

# ------------------------------------------------

sub render_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'render_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'render',
	});

	return $params[0];

} # End of render_1.

# ------------------------------------------------

sub repage_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'repage_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'repage',
	});

	return $params[0];

} # End of repage_1.

# ------------------------------------------------

sub resample_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'resample_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'resample',
	});

	return $params[0];

} # End of resample_1.

# ------------------------------------------------

sub resize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'resize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'resize',
	});

	return $params[0];

} # End of resize_1.

# ------------------------------------------------

sub respect_parentheses_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'respect_parentheses_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'respect',
	});

	return $params[0];

} # End of respect_parentheses_1.

# ------------------------------------------------

sub reverse_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'reverse_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'reverse',
	});

	return $params[0];

} # End of reverse_1.

# ------------------------------------------------

sub roll_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'roll_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'roll',
	});

	return $params[0];

} # End of roll_1.

# ------------------------------------------------

sub rotate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'rotate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'rotate',
	});

	return $params[0];

} # End of rotate_1.

# ------------------------------------------------

sub sample_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sample_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sample',
	});

	return $params[0];

} # End of sample_1.

# ------------------------------------------------

sub sampling_factor_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sampling_factor_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sampling',
	});

	return $params[0];

} # End of sampling_factor_1.

# ------------------------------------------------

sub scale_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'scale_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'scale',
	});

	return $params[0];

} # End of scale_1.

# ------------------------------------------------

sub scene_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'scene_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'scene',
	});

	return $params[0];

} # End of scene_1.

# ------------------------------------------------

sub screen_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'screen_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'screen',
	});

	return $params[0];

} # End of screen_1.

# ------------------------------------------------

sub seed_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'seed_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'seed',
	});

	return $params[0];

} # End of seed_1.

# ------------------------------------------------

sub segment_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'segment_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'segment',
	});

	return $params[0];

} # End of segment_1.

# ------------------------------------------------

sub selective_blur_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'selective_blur_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'selective',
	});

	return $params[0];

} # End of selective_blur_1.

# ------------------------------------------------

sub selective_blur_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'selective_blur_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'selective',
	});

	return $params[0];

} # End of selective_blur_2.

# ------------------------------------------------

sub separate_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'separate_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'separate',
	});

	return $params[0];

} # End of separate_1.

# ------------------------------------------------

sub sepia_tone_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sepia_tone_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sepia',
	});

	return $params[0];

} # End of sepia_tone_1.

# ------------------------------------------------

sub set_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'set_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'set',
	});

	return $params[0];

} # End of set_1.

# ------------------------------------------------

sub set_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'set_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'set',
	});

	return $params[0];

} # End of set_2.

# ------------------------------------------------

sub shade_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shade_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shade',
	});

	return $params[0];

} # End of shade_1.

# ------------------------------------------------

sub shadow_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shadow_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shadow',
	});

	return $params[0];

} # End of shadow_1.

# ------------------------------------------------

sub shared_memory_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shared_memory_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shared',
	});

	return $params[0];

} # End of shared_memory_1.

# ------------------------------------------------

sub sharpen_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sharpen_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sharpen',
	});

	return $params[0];

} # End of sharpen_1.

# ------------------------------------------------

sub sharpen_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sharpen_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sharpen',
	});

	return $params[0];

} # End of sharpen_2.

# ------------------------------------------------

sub shave_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shave_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shave',
	});

	return $params[0];

} # End of shave_1.

# ------------------------------------------------

sub shear_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shear_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shear',
	});

	return $params[0];

} # End of shear_1.

# ------------------------------------------------

sub sigmoidal_contrast_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sigmoidal_contrast_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sigmoidal',
	});

	return $params[0];

} # End of sigmoidal_contrast_1.

# ------------------------------------------------

sub silent_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'silent_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'silent',
	});

	return $params[0];

} # End of silent_1.

# ------------------------------------------------

sub similarity_threshold_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'similarity_threshold_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'similarity',
	});

	return $params[0];

} # End of similarity_threshold_1.

# ------------------------------------------------

sub size_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'size_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'size',
	});

	return $params[0];

} # End of size_1.

# ------------------------------------------------

sub sketch_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sketch_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sketch',
	});

	return $params[0];

} # End of sketch_1.

# ------------------------------------------------

sub sketch_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sketch_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sketch',
	});

	return $params[0];

} # End of sketch_2.

# ------------------------------------------------

sub smush_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'smush_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'smush',
	});

	return $params[0];

} # End of smush_1.

# ------------------------------------------------

sub snaps_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'snaps_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'snaps',
	});

	return $params[0];

} # End of snaps_1.

# ------------------------------------------------

sub solarize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'solarize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'solarize',
	});

	return $params[0];

} # End of solarize_1.

# ------------------------------------------------

sub splice_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'splice_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'splice',
	});

	return $params[0];

} # End of splice_1.

# ------------------------------------------------

sub spread_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'spread_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'spread',
	});

	return $params[0];

} # End of spread_1.

# ------------------------------------------------

sub statistic_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'statistic_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'statistic',
	});

	return $params[0];

} # End of statistic_1.

# ------------------------------------------------

sub stegano_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'stegano_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'stegano',
	});

	return $params[0];

} # End of stegano_1.

# ------------------------------------------------

sub stereo_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'stereo_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'stereo',
	});

	return $params[0];

} # End of stereo_1.

# ------------------------------------------------

sub storage_type_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'storage_type_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'storage',
	});

	return $params[0];

} # End of storage_type_1.

# ------------------------------------------------

sub stretch_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'stretch_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'stretch',
	});

	return $params[0];

} # End of stretch_1.

# ------------------------------------------------

sub strip_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'strip_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'strip',
	});

	return $params[0];

} # End of strip_1.

# ------------------------------------------------

sub stroke_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'stroke_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'stroke',
	});

	return $params[0];

} # End of stroke_1.

# ------------------------------------------------

sub strokewidth_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'strokewidth_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'strokewidth',
	});

	return $params[0];

} # End of strokewidth_1.

# ------------------------------------------------

sub style_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'style_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'style',
	});

	return $params[0];

} # End of style_1.

# ------------------------------------------------

sub subimage_search_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'subimage_search_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'subimage',
	});

	return $params[0];

} # End of subimage_search_1.

# ------------------------------------------------

sub swap_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'swap_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'swap',
	});

	return $params[0];

} # End of swap_1.

# ------------------------------------------------

sub swirl_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'swirl_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'swirl',
	});

	return $params[0];

} # End of swirl_1.

# ------------------------------------------------

sub synchronize_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'synchronize_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'synchronize',
	});

	return $params[0];

} # End of synchronize_1.

# ------------------------------------------------

sub taint_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'taint_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'taint',
	});

	return $params[0];

} # End of taint_1.

# ------------------------------------------------

sub text_font_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'text_font_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'text',
	});

	return $params[0];

} # End of text_font_1.

# ------------------------------------------------

sub texture_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'texture_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'texture',
	});

	return $params[0];

} # End of texture_1.

# ------------------------------------------------

sub threshold_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'threshold_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'threshold',
	});

	return $params[0];

} # End of threshold_1.

# ------------------------------------------------

sub thumbnail_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'thumbnail_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'thumbnail',
	});

	return $params[0];

} # End of thumbnail_1.

# ------------------------------------------------

sub tile_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tile_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tile',
	});

	return $params[0];

} # End of tile_1.

# ------------------------------------------------

sub tile_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tile_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tile',
	});

	return $params[0];

} # End of tile_2.

# ------------------------------------------------

sub tile_3
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tile_3');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tile',
	});

	return $params[0];

} # End of tile_3.

# ------------------------------------------------

sub tile_offset_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tile_offset_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tile',
	});

	return $params[0];

} # End of tile_offset_1.

# ------------------------------------------------

sub tint_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tint_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tint',
	});

	return $params[0];

} # End of tint_1.

# ------------------------------------------------

sub title_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'title_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'title',
	});

	return $params[0];

} # End of title_1.

# ------------------------------------------------

sub transform_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transform_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transform',
	});

	return $params[0];

} # End of transform_1.

# ------------------------------------------------

sub transparent_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transparent_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transparent',
	});

	return $params[0];

} # End of transparent_1.

# ------------------------------------------------

sub transparent_color_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transparent_color_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transparent',
	});

	return $params[0];

} # End of transparent_color_1.

# ------------------------------------------------

sub transpose_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transpose_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transpose',
	});

	return $params[0];

} # End of transpose_1.

# ------------------------------------------------

sub transverse_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transverse_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transverse',
	});

	return $params[0];

} # End of transverse_1.

# ------------------------------------------------

sub treedepth_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'treedepth_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'treedepth',
	});

	return $params[0];

} # End of treedepth_1.

# ------------------------------------------------

sub trim_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'trim_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'trim',
	});

	return $params[0];

} # End of trim_1.

# ------------------------------------------------

sub type_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'type_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'type',
	});

	return $params[0];

} # End of type_1.

# ------------------------------------------------

sub undercolor_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'undercolor_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'undercolor',
	});

	return $params[0];

} # End of undercolor_1.

# ------------------------------------------------

sub unique_colors_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'unique_colors_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'unique',
	});

	return $params[0];

} # End of unique_colors_1.

# ------------------------------------------------

sub units_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'units_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'units',
	});

	return $params[0];

} # End of units_1.

# ------------------------------------------------

sub unsharp_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'unsharp_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'unsharp',
	});

	return $params[0];

} # End of unsharp_1.

# ------------------------------------------------

sub unsharp_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'unsharp_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'unsharp',
	});

	return $params[0];

} # End of unsharp_2.

# ------------------------------------------------

sub update_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'update_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'update',
	});

	return $params[0];

} # End of update_1.

# ------------------------------------------------

sub verbose_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'verbose_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'verbose',
	});

	return $params[0];

} # End of verbose_1.

# ------------------------------------------------

sub version_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'version_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'version',
	});

	return $params[0];

} # End of version_1.

# ------------------------------------------------

sub view_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'view_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'view',
	});

	return $params[0];

} # End of view_1.

# ------------------------------------------------

sub vignette_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'vignette_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'vignette',
	});

	return $params[0];

} # End of vignette_1.

# ------------------------------------------------

sub virtual_pixel_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'virtual_pixel_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'virtual',
	});

	return $params[0];

} # End of virtual_pixel_1.

# ------------------------------------------------

sub visual_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'visual_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'visual',
	});

	return $params[0];

} # End of visual_1.

# ------------------------------------------------

sub watermark_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'watermark_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'watermark',
	});

	return $params[0];

} # End of watermark_1.

# ------------------------------------------------

sub wave_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'wave_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'wave',
	});

	return $params[0];

} # End of wave_1.

# ------------------------------------------------

sub wave_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'wave_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'wave',
	});

	return $params[0];

} # End of wave_2.

# ------------------------------------------------

sub weight_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'weight_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'weight',
	});

	return $params[0];

} # End of weight_1.

# ------------------------------------------------

sub white_point_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'white_point_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'white',
	});

	return $params[0];

} # End of white_point_1.

# ------------------------------------------------

sub white_threshold_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'white_threshold_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'white',
	});

	return $params[0];

} # End of white_threshold_1.

# ------------------------------------------------

sub window_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'window_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'window',
	});

	return $params[0];

} # End of window_1.

# ------------------------------------------------

sub window_group_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'window_group_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'window',
	});

	return $params[0];

} # End of window_group_1.

# ------------------------------------------------

sub write_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'write_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'write',
	});

	return $params[0];

} # End of write_1.

# ------------------------------------------------

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

Ron Savage I<E<lt>ron@savage.net.auE<gt>>.

Home page: L<http://savage.net.au/>.

=head1 Copyright

Australian copyright (c) 2016, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Artistic License 2.0, a copy of which is available at:
	http://www.opensource.org/licenses/index.html

=cut
