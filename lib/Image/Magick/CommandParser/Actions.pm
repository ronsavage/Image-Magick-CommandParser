package Image::Magick::CommandParser::Actions;

use strict;
use warnings;

# Warning: Do not use Moo or anything similar.
# This class needs a sub new() due to the way
# Marpa calls the constructor.

our $VERSION = '1.00';

# ------------------------------------------------

sub adaptive_blur_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'adaptive_blur_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'adaptive_blur',
	});

	return $params[0];

} # End of adaptive_blur_action_1.

# ------------------------------------------------

sub adaptive_resize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'adaptive_resize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'adaptive_resize',
	});

	return $params[0];

} # End of adaptive_resize_action_1.

# ------------------------------------------------

sub adaptive_sharpen_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'adaptive_sharpen_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'adaptive_sharpen',
	});

	return $params[0];

} # End of adaptive_sharpen_action_1.

# ------------------------------------------------

sub adjoin_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'adjoin_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'adjoin',
	});

	return $params[0];

} # End of adjoin_action_1.

# ------------------------------------------------

sub affine_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'affine_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'affine',
	});

	return $params[0];

} # End of affine_action_1.

# ------------------------------------------------

sub alpha_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'alpha_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'alpha',
	});

	return $params[0];

} # End of alpha_action_1.

# ------------------------------------------------

sub annotate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'annotate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'annotate',
	});

	return $params[0];

} # End of annotate_action_1.

# ------------------------------------------------

sub annotate_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'annotate_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'annotate',
	});

	return $params[0];

} # End of annotate_action_2.

# ------------------------------------------------

sub annotate_action_3
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'annotate_action_3');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'annotate',
	});

	return $params[0];

} # End of annotate_action_3.

# ------------------------------------------------

sub annotate_action_4
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'annotate_action_4');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'annotate',
	});

	return $params[0];

} # End of annotate_action_4.

# ------------------------------------------------

sub antialias_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'antialias_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'antialias',
	});

	return $params[0];

} # End of antialias_action_1.

# ------------------------------------------------

sub append_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'append_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'append',
	});

	return $params[0];

} # End of append_action_1.

# ------------------------------------------------

sub attenuate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'attenuate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'attenuate',
	});

	return $params[0];

} # End of attenuate_action_1.

# ------------------------------------------------

sub authenticate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'authenticate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'authenticate',
	});

	return $params[0];

} # End of authenticate_action_1.

# ------------------------------------------------

sub auto_gamma_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'auto_gamma_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'auto_gamma',
	});

	return $params[0];

} # End of auto_gamma_action_1.

# ------------------------------------------------

sub auto_level_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'auto_level_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'auto_level',
	});

	return $params[0];

} # End of auto_level_action_1.

# ------------------------------------------------

sub auto_orient_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'auto_orient_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'auto_orient',
	});

	return $params[0];

} # End of auto_orient_action_1.

# ------------------------------------------------

sub average_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'average_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'average',
	});

	return $params[0];

} # End of average_action_1.

# ------------------------------------------------

sub backdrop_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'backdrop_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'backdrop',
	});

	return $params[0];

} # End of backdrop_action_1.

# ------------------------------------------------

sub background_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'background_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'background',
	});

	return $params[0];

} # End of background_action_1.

# ------------------------------------------------

sub bench_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'bench_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'bench',
	});

	return $params[0];

} # End of bench_action_1.

# ------------------------------------------------

sub bias_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'bias_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'bias',
	});

	return $params[0];

} # End of bias_action_1.

# ------------------------------------------------

sub black_point_compensation_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'black_point_compensation_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'black_point_compensation',
	});

	return $params[0];

} # End of black_point_compensation_action_1.

# ------------------------------------------------

sub black_threshold_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'black_threshold_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'black_threshold',
	});

	return $params[0];

} # End of black_threshold_action_1.

# ------------------------------------------------

sub blend_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blend_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blend',
	});

	return $params[0];

} # End of blend_action_1.

# ------------------------------------------------

sub blue_primary_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blue_primary_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blue_primary',
	});

	return $params[0];

} # End of blue_primary_action_1.

# ------------------------------------------------

sub blue_shift_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blue_shift_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blue_shift',
	});

	return $params[0];

} # End of blue_shift_action_1.

# ------------------------------------------------

sub blur_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blur_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blur',
	});

	return $params[0];

} # End of blur_action_1.

# ------------------------------------------------

sub blur_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blur_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blur',
	});

	return $params[0];

} # End of blur_action_2.

# ------------------------------------------------

sub blur_action_3
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'blur_action_3');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'blur',
	});

	return $params[0];

} # End of blur_action_3.

# ------------------------------------------------

sub border_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'border_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'border',
	});

	return $params[0];

} # End of border_action_1.

# ------------------------------------------------

sub bordercolor_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'bordercolor_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'bordercolor',
	});

	return $params[0];

} # End of bordercolor_action_1.

# ------------------------------------------------

sub borderwidth_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'borderwidth_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'borderwidth',
	});

	return $params[0];

} # End of borderwidth_action_1.

# ------------------------------------------------

sub brightness_contrast_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'brightness_contrast_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'brightness_contrast',
	});

	return $params[0];

} # End of brightness_contrast_action_1.

# ------------------------------------------------

sub brightness_contrast_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'brightness_contrast_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'brightness_contrast',
	});

	return $params[0];

} # End of brightness_contrast_action_2.

# ------------------------------------------------

sub cache_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'cache_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'cache',
	});

	return $params[0];

} # End of cache_action_1.

# ------------------------------------------------

sub canny_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'canny_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'canny',
	});

	return $params[0];

} # End of canny_action_1.

# ------------------------------------------------

sub canny_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'canny_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'canny',
	});

	return $params[0];

} # End of canny_action_2.

# ------------------------------------------------

sub caption_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'caption_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'caption',
	});

	return $params[0];

} # End of caption_action_1.

# ------------------------------------------------

sub cdl_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'cdl_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'cdl',
	});

	return $params[0];

} # End of cdl_action_1.

# ------------------------------------------------

sub channel_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'channel_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'channel',
	});

	return $params[0];

} # End of channel_action_1.

# ------------------------------------------------

sub charcoal_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'charcoal_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'charcoal',
	});

	return $params[0];

} # End of charcoal_action_1.

# ------------------------------------------------

sub chop_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'chop_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'chop',
	});

	return $params[0];

} # End of chop_action_1.

# ------------------------------------------------

sub clamp_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clamp_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clamp',
	});

	return $params[0];

} # End of clamp_action_1.

# ------------------------------------------------

sub clip_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clip_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clip',
	});

	return $params[0];

} # End of clip_action_1.

# ------------------------------------------------

sub clip_mask_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clip_mask_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clip_mask',
	});

	return $params[0];

} # End of clip_mask_action_1.

# ------------------------------------------------

sub clip_path_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clip_path_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clip_path',
	});

	return $params[0];

} # End of clip_path_action_1.

# ------------------------------------------------

sub clone_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clone_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clone',
	});

	return $params[0];

} # End of clone_action_1.

# ------------------------------------------------

sub clut_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'clut_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'clut',
	});

	return $params[0];

} # End of clut_action_1.

# ------------------------------------------------

sub coalesce_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'coalesce_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'coalesce',
	});

	return $params[0];

} # End of coalesce_action_1.

# ------------------------------------------------

sub color_matrix_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'color_matrix_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'color_matrix',
	});

	return $params[0];

} # End of color_matrix_action_1.

# ------------------------------------------------

sub colorize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'colorize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'colorize',
	});

	return $params[0];

} # End of colorize_action_1.

# ------------------------------------------------

sub colormap_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'colormap_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'colormap',
	});

	return $params[0];

} # End of colormap_action_1.

# ------------------------------------------------

sub colors_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'colors_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'colors',
	});

	return $params[0];

} # End of colors_action_1.

# ------------------------------------------------

sub colorspace_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'colorspace_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'colorspace',
	});

	return $params[0];

} # End of colorspace_action_1.

# ------------------------------------------------

sub combine_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'combine_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'combine',
	});

	return $params[0];

} # End of combine_action_1.

# ------------------------------------------------

sub command_action
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'command_action');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params],
		sign	=> '',
		rule	=> 'command',
	});

	return $params[0];

} # End of command_action.

# ------------------------------------------------

sub comment_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'comment_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'comment',
	});

	return $params[0];

} # End of comment_action_1.

# ------------------------------------------------

sub compare_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'compare_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'compare',
	});

	return $params[0];

} # End of compare_action_1.

# ------------------------------------------------

sub complex_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'complex_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'complex',
	});

	return $params[0];

} # End of complex_action_1.

# ------------------------------------------------

sub compose_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'compose_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'compose',
	});

	return $params[0];

} # End of compose_action_1.

# ------------------------------------------------

sub composite_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'composite_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'composite',
	});

	return $params[0];

} # End of composite_action_1.

# ------------------------------------------------

sub compress_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'compress_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'compress',
	});

	return $params[0];

} # End of compress_action_1.

# ------------------------------------------------

sub connected_components_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'connected_components_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'connected_components',
	});

	return $params[0];

} # End of connected_components_action_1.

# ------------------------------------------------

sub contrast_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'contrast_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'contrast',
	});

	return $params[0];

} # End of contrast_action_1.

# ------------------------------------------------

sub contrast_stretch_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'contrast_stretch_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'contrast_stretch',
	});

	return $params[0];

} # End of contrast_stretch_action_1.

# ------------------------------------------------

sub contrast_stretch_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'contrast_stretch_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'contrast_stretch',
	});

	return $params[0];

} # End of contrast_stretch_action_2.

# ------------------------------------------------

sub convolve_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'convolve_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'convolve',
	});

	return $params[0];

} # End of convolve_action_1.

# ------------------------------------------------

sub copy_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'copy_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'copy',
	});

	return $params[0];

} # End of copy_action_1.

# ------------------------------------------------

sub crop_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'crop_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'crop',
	});

	return $params[0];

} # End of crop_action_1.

# ------------------------------------------------

sub cycle_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'cycle_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'cycle',
	});

	return $params[0];

} # End of cycle_action_1.

# ------------------------------------------------

sub debug_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'debug_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'debug',
	});

	return $params[0];

} # End of debug_action_1.

# ------------------------------------------------

sub decipher_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'decipher_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'decipher',
	});

	return $params[0];

} # End of decipher_action_1.

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

sub deconstruct_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'deconstruct_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'deconstruct',
	});

	return $params[0];

} # End of deconstruct_action_1.

# ------------------------------------------------

sub delay_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'delay_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'delay',
	});

	return $params[0];

} # End of delay_action_1.

# ------------------------------------------------

sub delay_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'delay_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'delay',
	});

	return $params[0];

} # End of delay_action_2.

# ------------------------------------------------

sub delete_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'delete_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'delete',
	});

	return $params[0];

} # End of delete_action_1.

# ------------------------------------------------

sub density_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'density_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'density',
	});

	return $params[0];

} # End of density_action_1.

# ------------------------------------------------

sub density_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'density_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'density',
	});

	return $params[0];

} # End of density_action_2.

# ------------------------------------------------

sub depth_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'depth_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'depth',
	});

	return $params[0];

} # End of depth_action_1.

# ------------------------------------------------

sub descend_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'descend_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'descend',
	});

	return $params[0];

} # End of descend_action_1.

# ------------------------------------------------

sub deskew_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'deskew_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'deskew',
	});

	return $params[0];

} # End of deskew_action_1.

# ------------------------------------------------

sub despeckle_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'despeckle_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'despeckle',
	});

	return $params[0];

} # End of despeckle_action_1.

# ------------------------------------------------

sub direction_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'direction_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'direction',
	});

	return $params[0];

} # End of direction_action_1.

# ------------------------------------------------

sub displace_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'displace_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'displace',
	});

	return $params[0];

} # End of displace_action_1.

# ------------------------------------------------

sub displace_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'displace_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'displace',
	});

	return $params[0];

} # End of displace_action_2.

# ------------------------------------------------

sub display_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'display_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'display',
	});

	return $params[0];

} # End of display_action_1.

# ------------------------------------------------

sub dispose_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'dispose_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'dispose',
	});

	return $params[0];

} # End of dispose_action_1.

# ------------------------------------------------

sub dissimilarity_threshold_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'dissimilarity_threshold_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'dissimilarity_threshold',
	});

	return $params[0];

} # End of dissimilarity_threshold_action_1.

# ------------------------------------------------

sub dissolve_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'dissolve_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'dissolve',
	});

	return $params[0];

} # End of dissolve_action_1.

# ------------------------------------------------

sub distribute_cache_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'distribute_cache_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'distribute_cache',
	});

	return $params[0];

} # End of distribute_cache_action_1.

# ------------------------------------------------

sub dither_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'dither_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'dither',
	});

	return $params[0];

} # End of dither_action_1.

# ------------------------------------------------

sub draw_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'draw_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'draw',
	});

	return $params[0];

} # End of draw_action_1.

# ------------------------------------------------

sub duplicate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'duplicate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'duplicate',
	});

	return $params[0];

} # End of duplicate_action_1.

# ------------------------------------------------

sub edge_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'edge_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'edge',
	});

	return $params[0];

} # End of edge_action_1.

# ------------------------------------------------

sub emboss_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'emboss_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'emboss',
	});

	return $params[0];

} # End of emboss_action_1.

# ------------------------------------------------

sub encipher_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'encipher_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'encipher',
	});

	return $params[0];

} # End of encipher_action_1.

# ------------------------------------------------

sub encoding_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'encoding_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'encoding',
	});

	return $params[0];

} # End of encoding_action_1.

# ------------------------------------------------

sub endian_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'endian_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'endian',
	});

	return $params[0];

} # End of endian_action_1.

# ------------------------------------------------

sub enhance_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'enhance_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'enhance',
	});

	return $params[0];

} # End of enhance_action_1.

# ------------------------------------------------

sub equalize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'equalize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'equalize',
	});

	return $params[0];

} # End of equalize_action_1.

# ------------------------------------------------

sub evaluate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'evaluate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'evaluate',
	});

	return $params[0];

} # End of evaluate_action_1.

# ------------------------------------------------

sub evaluate_sequence_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'evaluate_sequence_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'evaluate_sequence',
	});

	return $params[0];

} # End of evaluate_sequence_action_1.

# ------------------------------------------------

sub extent_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'extent_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'extent',
	});

	return $params[0];

} # End of extent_action_1.

# ------------------------------------------------

sub extract_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'extract_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'extract',
	});

	return $params[0];

} # End of extract_action_1.

# ------------------------------------------------

sub family_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'family_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'family',
	});

	return $params[0];

} # End of family_action_1.

# ------------------------------------------------

sub features_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'features_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'features',
	});

	return $params[0];

} # End of features_action_1.

# ------------------------------------------------

sub fft_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'fft_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'fft',
	});

	return $params[0];

} # End of fft_action_1.

# ------------------------------------------------

sub fill_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'fill_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'fill',
	});

	return $params[0];

} # End of fill_action_1.

# ------------------------------------------------

sub filter_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'filter_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'filter',
	});

	return $params[0];

} # End of filter_action_1.

# ------------------------------------------------

sub flatten_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'flatten_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'flatten',
	});

	return $params[0];

} # End of flatten_action_1.

# ------------------------------------------------

sub flip_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'flip_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'flip',
	});

	return $params[0];

} # End of flip_action_1.

# ------------------------------------------------

sub floodfill_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'floodfill_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'floodfill',
	});

	return $params[0];

} # End of floodfill_action_1.

# ------------------------------------------------

sub flop_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'flop_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'flop',
	});

	return $params[0];

} # End of flop_action_1.

# ------------------------------------------------

sub font_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'font_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'font',
	});

	return $params[0];

} # End of font_action_1.

# ------------------------------------------------

sub foreground_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'foreground_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'foreground',
	});

	return $params[0];

} # End of foreground_action_1.

# ------------------------------------------------

sub format_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'format_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'format',
	});

	return $params[0];

} # End of format_action_1.

# ------------------------------------------------

sub format_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'format_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'format',
	});

	return $params[0];

} # End of format_action_2.

# ------------------------------------------------

sub frame_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'frame_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'frame',
	});

	return $params[0];

} # End of frame_action_1.

# ------------------------------------------------

sub frame_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'frame_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'frame',
	});

	return $params[0];

} # End of frame_action_2.

# ------------------------------------------------

sub function_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'function_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'function',
	});

	return $params[0];

} # End of function_action_1.

# ------------------------------------------------

sub fuzz_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'fuzz_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'fuzz',
	});

	return $params[0];

} # End of fuzz_action_1.

# ------------------------------------------------

sub fx_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'fx_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'fx',
	});

	return $params[0];

} # End of fx_action_1.

# ------------------------------------------------

sub gamma_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'gamma_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'gamma',
	});

	return $params[0];

} # End of gamma_action_1.

# ------------------------------------------------

sub gaussian_blur_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'gaussian_blur_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'gaussian_blur',
	});

	return $params[0];

} # End of gaussian_blur_action_1.

# ------------------------------------------------

sub gaussian_blur_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'gaussian_blur_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'gaussian_blur',
	});

	return $params[0];

} # End of gaussian_blur_action_2.

# ------------------------------------------------

sub geometry_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'geometry_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'geometry',
	});

	return $params[0];

} # End of geometry_action_1.

# ------------------------------------------------

sub gravity_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'gravity_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'gravity',
	});

	return $params[0];

} # End of gravity_action_1.

# ------------------------------------------------

sub grayscale_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'grayscale_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'grayscale',
	});

	return $params[0];

} # End of grayscale_action_1.

# ------------------------------------------------

sub green_primary_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'green_primary_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'green_primary',
	});

	return $params[0];

} # End of green_primary_action_1.

# ------------------------------------------------

sub hald_clut_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'hald_clut_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'hald_clut',
	});

	return $params[0];

} # End of hald_clut_action_1.

# ------------------------------------------------

sub help_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'help_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'help',
	});

	return $params[0];

} # End of help_action_1.

# ------------------------------------------------

sub highlight_color_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'highlight_color_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'highlight_color',
	});

	return $params[0];

} # End of highlight_color_action_1.

# ------------------------------------------------

sub hough_lines_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'hough_lines_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'hough_lines',
	});

	return $params[0];

} # End of hough_lines_action_1.

# ------------------------------------------------

sub iconGeometry_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'iconGeometry_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'iconGeometry',
	});

	return $params[0];

} # End of iconGeometry_action_1.

# ------------------------------------------------

sub iconic_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'iconic_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'iconic',
	});

	return $params[0];

} # End of iconic_action_1.

# ------------------------------------------------

sub identify_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'identify_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'identify',
	});

	return $params[0];

} # End of identify_action_1.

# ------------------------------------------------

sub ift_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'ift_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'ift',
	});

	return $params[0];

} # End of ift_action_1.

# ------------------------------------------------

sub immutable_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'immutable_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'immutable',
	});

	return $params[0];

} # End of immutable_action_1.

# ------------------------------------------------

sub implode_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'implode_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'implode',
	});

	return $params[0];

} # End of implode_action_1.

# ------------------------------------------------

sub input_file_action
{
	my($cache, @params) = @_;

	$$cache{logger} -> log(debug => 'input_file_action');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params],
		sign	=> '',
		rule	=> 'input_file',
	});

	return $params[0];

} # End of input_file_action.

# ------------------------------------------------

sub insert_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'insert_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'insert',
	});

	return $params[0];

} # End of insert_action_1.

# ------------------------------------------------

sub intensity_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'intensity_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'intensity',
	});

	return $params[0];

} # End of intensity_action_1.

# ------------------------------------------------

sub intent_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'intent_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'intent',
	});

	return $params[0];

} # End of intent_action_1.

# ------------------------------------------------

sub interlace_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'interlace_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'interlace',
	});

	return $params[0];

} # End of interlace_action_1.

# ------------------------------------------------

sub interline_spacing_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'interline_spacing_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'interline_spacing',
	});

	return $params[0];

} # End of interline_spacing_action_1.

# ------------------------------------------------

sub interpolate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'interpolate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'interpolate',
	});

	return $params[0];

} # End of interpolate_action_1.

# ------------------------------------------------

sub interword_spacing_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'interword_spacing_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'interword_spacing',
	});

	return $params[0];

} # End of interword_spacing_action_1.

# ------------------------------------------------

sub kerning_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'kerning_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'kerning',
	});

	return $params[0];

} # End of kerning_action_1.

# ------------------------------------------------

sub kuwahara_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'kuwahara_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'kuwahara',
	});

	return $params[0];

} # End of kuwahara_action_1.

# ------------------------------------------------

sub kuwahara_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'kuwahara_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'kuwahara',
	});

	return $params[0];

} # End of kuwahara_action_2.

# ------------------------------------------------

sub label_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'label_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'label',
	});

	return $params[0];

} # End of label_action_1.

# ------------------------------------------------

sub lat_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'lat_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'lat',
	});

	return $params[0];

} # End of lat_action_1.

# ------------------------------------------------

sub lat_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'lat_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'lat',
	});

	return $params[0];

} # End of lat_action_2.

# ------------------------------------------------

sub layers_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'layers_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'layers',
	});

	return $params[0];

} # End of layers_action_1.

# ------------------------------------------------

sub level_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'level_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'level',
	});

	return $params[0];

} # End of level_action_1.

# ------------------------------------------------

sub level_colors_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'level_colors_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'level_colors',
	});

	return $params[0];

} # End of level_colors_action_1.

# ------------------------------------------------

sub limit_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'limit_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'limit',
	});

	return $params[0];

} # End of limit_action_1.

# ------------------------------------------------

sub linear_stretch_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'linear_stretch_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'linear_stretch',
	});

	return $params[0];

} # End of linear_stretch_action_1.

# ------------------------------------------------

sub linear_stretch_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'linear_stretch_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'linear_stretch',
	});

	return $params[0];

} # End of linear_stretch_action_2.

# ------------------------------------------------

sub linewidth_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'linewidth_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'linewidth',
	});

	return $params[0];

} # End of linewidth_action_1.

# ------------------------------------------------

sub liquid_rescale_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'liquid_rescale_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'liquid_rescale',
	});

	return $params[0];

} # End of liquid_rescale_action_1.

# ------------------------------------------------

sub list_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'list_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'list',
	});

	return $params[0];

} # End of list_action_1.

# ------------------------------------------------

sub log_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'log_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'log',
	});

	return $params[0];

} # End of log_action_1.

# ------------------------------------------------

sub loop_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'loop_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'loop',
	});

	return $params[0];

} # End of loop_action_1.

# ------------------------------------------------

sub lowlight_color_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'lowlight_color_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'lowlight_color',
	});

	return $params[0];

} # End of lowlight_color_action_1.

# ------------------------------------------------

sub magnify_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'magnify_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'magnify',
	});

	return $params[0];

} # End of magnify_action_1.

# ------------------------------------------------

sub map_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'map_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'map',
	});

	return $params[0];

} # End of map_action_1.

# ------------------------------------------------

sub map_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'map_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'map',
	});

	return $params[0];

} # End of map_action_2.

# ------------------------------------------------

sub mask_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mask_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mask',
	});

	return $params[0];

} # End of mask_action_1.

# ------------------------------------------------

sub mattecolor_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mattecolor_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mattecolor',
	});

	return $params[0];

} # End of mattecolor_action_1.

# ------------------------------------------------

sub maximum_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'maximum_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'maximum',
	});

	return $params[0];

} # End of maximum_action_1.

# ------------------------------------------------

sub mean_shift_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mean_shift_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mean_shift',
	});

	return $params[0];

} # End of mean_shift_action_1.

# ------------------------------------------------

sub median_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'median_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'median',
	});

	return $params[0];

} # End of median_action_1.

# ------------------------------------------------

sub metric_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'metric_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'metric',
	});

	return $params[0];

} # End of metric_action_1.

# ------------------------------------------------

sub minimum_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'minimum_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'minimum',
	});

	return $params[0];

} # End of minimum_action_1.

# ------------------------------------------------

sub mode_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mode_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mode',
	});

	return $params[0];

} # End of mode_action_1.

# ------------------------------------------------

sub mode_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mode_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mode',
	});

	return $params[0];

} # End of mode_action_2.

# ------------------------------------------------

sub modulate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'modulate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'modulate',
	});

	return $params[0];

} # End of modulate_action_1.

# ------------------------------------------------

sub moments_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'moments_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'moments',
	});

	return $params[0];

} # End of moments_action_1.

# ------------------------------------------------

sub monitor_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'monitor_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'monitor',
	});

	return $params[0];

} # End of monitor_action_1.

# ------------------------------------------------

sub monochrome_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'monochrome_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'monochrome',
	});

	return $params[0];

} # End of monochrome_action_1.

# ------------------------------------------------

sub morph_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'morph_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'morph',
	});

	return $params[0];

} # End of morph_action_1.

# ------------------------------------------------

sub mosaic_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'mosaic_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'mosaic',
	});

	return $params[0];

} # End of mosaic_action_1.

# ------------------------------------------------

sub motion_blur_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'motion_blur_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'motion_blur',
	});

	return $params[0];

} # End of motion_blur_action_1.

# ------------------------------------------------

sub motion_blur_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'motion_blur_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'motion_blur',
	});

	return $params[0];

} # End of motion_blur_action_2.

# ------------------------------------------------

sub name_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'name_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'name',
	});

	return $params[0];

} # End of name_action_1.

# ------------------------------------------------

sub negate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'negate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'negate',
	});

	return $params[0];

} # End of negate_action_1.

# ------------------------------------------------

sub new
{
	my($class) = @_;

	return bless {}, $class;

} # End of new.

# ------------------------------------------------

sub noise_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'noise_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'noise',
	});

	return $params[0];

} # End of noise_action_1.

# ------------------------------------------------

sub noise_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'noise_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'noise',
	});

	return $params[0];

} # End of noise_action_2.

# ------------------------------------------------

sub normalize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'normalize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'normalize',
	});

	return $params[0];

} # End of normalize_action_1.

# ------------------------------------------------

sub opaque_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'opaque_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'opaque',
	});

	return $params[0];

} # End of opaque_action_1.

# ------------------------------------------------

sub orient_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'orient_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'orient',
	});

	return $params[0];

} # End of orient_action_1.

# ------------------------------------------------

sub page_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'page_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'page',
	});

	return $params[0];

} # End of page_action_1.

# ------------------------------------------------

sub page_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'page_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'page',
	});

	return $params[0];

} # End of page_action_2.

# ------------------------------------------------

sub page_action_3
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'page_action_3');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'page',
	});

	return $params[0];

} # End of page_action_3.

# ------------------------------------------------

sub paint_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'paint_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'paint',
	});

	return $params[0];

} # End of paint_action_1.

# ------------------------------------------------

sub path_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'path_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'path',
	});

	return $params[0];

} # End of path_action_1.

# ------------------------------------------------

sub pause_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'pause_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'pause',
	});

	return $params[0];

} # End of pause_action_1.

# ------------------------------------------------

sub pause_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'pause_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'pause',
	});

	return $params[0];

} # End of pause_action_2.

# ------------------------------------------------

sub perceptible_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'perceptible_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'perceptible',
	});

	return $params[0];

} # End of perceptible_action_1.

# ------------------------------------------------

sub ping_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'ping_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'ping',
	});

	return $params[0];

} # End of ping_action_1.

# ------------------------------------------------

sub pointsize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'pointsize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'pointsize',
	});

	return $params[0];

} # End of pointsize_action_1.

# ------------------------------------------------

sub polaroid_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'polaroid_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'polaroid',
	});

	return $params[0];

} # End of polaroid_action_1.

# ------------------------------------------------

sub posterize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'posterize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'posterize',
	});

	return $params[0];

} # End of posterize_action_1.

# ------------------------------------------------

sub precision_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'precision_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'precision',
	});

	return $params[0];

} # End of precision_action_1.

# ------------------------------------------------

sub preview_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'preview_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'preview',
	});

	return $params[0];

} # End of preview_action_1.

# ------------------------------------------------

sub print_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'print_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'print',
	});

	return $params[0];

} # End of print_action_1.

# ------------------------------------------------

sub process_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'process_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'process',
	});

	return $params[0];

} # End of process_action_1.

# ------------------------------------------------

sub profile_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'profile_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'profile',
	});

	return $params[0];

} # End of profile_action_1.

# ------------------------------------------------

sub profile_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'profile_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'profile',
	});

	return $params[0];

} # End of profile_action_2.

# ------------------------------------------------

sub quality_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'quality_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'quality',
	});

	return $params[0];

} # End of quality_action_1.

# ------------------------------------------------

sub quantize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'quantize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'quantize',
	});

	return $params[0];

} # End of quantize_action_1.

# ------------------------------------------------

sub quiet_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'quiet_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'quiet',
	});

	return $params[0];

} # End of quiet_action_1.

# ------------------------------------------------

sub radial_blur_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'radial_blur_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'radial_blur',
	});

	return $params[0];

} # End of radial_blur_action_1.

# ------------------------------------------------

sub raise_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'raise_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'raise',
	});

	return $params[0];

} # End of raise_action_1.

# ------------------------------------------------

sub random_threshold_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'random_threshold_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'random_threshold',
	});

	return $params[0];

} # End of random_threshold_action_1.

# ------------------------------------------------

sub red_primary_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'red_primary_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'red_primary',
	});

	return $params[0];

} # End of red_primary_action_1.

# ------------------------------------------------

sub regard_warnings_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'regard_warnings_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'regard_warnings',
	});

	return $params[0];

} # End of regard_warnings_action_1.

# ------------------------------------------------

sub region_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'region_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'region',
	});

	return $params[0];

} # End of region_action_1.

# ------------------------------------------------

sub remap_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'remap_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'remap',
	});

	return $params[0];

} # End of remap_action_1.

# ------------------------------------------------

sub remote_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'remote_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'remote',
	});

	return $params[0];

} # End of remote_action_1.

# ------------------------------------------------

sub render_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'render_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'render',
	});

	return $params[0];

} # End of render_action_1.

# ------------------------------------------------

sub repage_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'repage_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'repage',
	});

	return $params[0];

} # End of repage_action_1.

# ------------------------------------------------

sub resample_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'resample_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'resample',
	});

	return $params[0];

} # End of resample_action_1.

# ------------------------------------------------

sub resize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'resize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'resize',
	});

	return $params[0];

} # End of resize_action_1.

# ------------------------------------------------

sub respect_parentheses_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'respect_parentheses_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'respect_parentheses',
	});

	return $params[0];

} # End of respect_parentheses_action_1.

# ------------------------------------------------

sub reverse_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'reverse_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'reverse',
	});

	return $params[0];

} # End of reverse_action_1.

# ------------------------------------------------

sub roll_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'roll_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'roll',
	});

	return $params[0];

} # End of roll_action_1.

# ------------------------------------------------

sub rotate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'rotate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'rotate',
	});

	return $params[0];

} # End of rotate_action_1.

# ------------------------------------------------

sub sample_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sample_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sample',
	});

	return $params[0];

} # End of sample_action_1.

# ------------------------------------------------

sub sampling_factor_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sampling_factor_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sampling_factor',
	});

	return $params[0];

} # End of sampling_factor_action_1.

# ------------------------------------------------

sub scale_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'scale_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'scale',
	});

	return $params[0];

} # End of scale_action_1.

# ------------------------------------------------

sub scene_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'scene_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'scene',
	});

	return $params[0];

} # End of scene_action_1.

# ------------------------------------------------

sub screen_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'screen_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'screen',
	});

	return $params[0];

} # End of screen_action_1.

# ------------------------------------------------

sub seed_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'seed_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'seed',
	});

	return $params[0];

} # End of seed_action_1.

# ------------------------------------------------

sub segment_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'segment_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'segment',
	});

	return $params[0];

} # End of segment_action_1.

# ------------------------------------------------

sub selective_blur_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'selective_blur_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'selective_blur',
	});

	return $params[0];

} # End of selective_blur_action_1.

# ------------------------------------------------

sub selective_blur_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'selective_blur_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'selective_blur',
	});

	return $params[0];

} # End of selective_blur_action_2.

# ------------------------------------------------

sub separate_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'separate_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'separate',
	});

	return $params[0];

} # End of separate_action_1.

# ------------------------------------------------

sub sepia_tone_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sepia_tone_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sepia_tone',
	});

	return $params[0];

} # End of sepia_tone_action_1.

# ------------------------------------------------

sub set_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'set_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'set',
	});

	return $params[0];

} # End of set_action_1.

# ------------------------------------------------

sub set_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'set_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'set',
	});

	return $params[0];

} # End of set_action_2.

# ------------------------------------------------

sub shade_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shade_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shade',
	});

	return $params[0];

} # End of shade_action_1.

# ------------------------------------------------

sub shadow_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shadow_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shadow',
	});

	return $params[0];

} # End of shadow_action_1.

# ------------------------------------------------

sub shared_memory_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shared_memory_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shared_memory',
	});

	return $params[0];

} # End of shared_memory_action_1.

# ------------------------------------------------

sub sharpen_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sharpen_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sharpen',
	});

	return $params[0];

} # End of sharpen_action_1.

# ------------------------------------------------

sub sharpen_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sharpen_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sharpen',
	});

	return $params[0];

} # End of sharpen_action_2.

# ------------------------------------------------

sub shave_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shave_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shave',
	});

	return $params[0];

} # End of shave_action_1.

# ------------------------------------------------

sub shear_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'shear_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'shear',
	});

	return $params[0];

} # End of shear_action_1.

# ------------------------------------------------

sub sigmoidal_contrast_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sigmoidal_contrast_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sigmoidal_contrast',
	});

	return $params[0];

} # End of sigmoidal_contrast_action_1.

# ------------------------------------------------

sub silent_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'silent_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'silent',
	});

	return $params[0];

} # End of silent_action_1.

# ------------------------------------------------

sub similarity_threshold_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'similarity_threshold_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'similarity_threshold',
	});

	return $params[0];

} # End of similarity_threshold_action_1.

# ------------------------------------------------

sub size_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'size_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'size',
	});

	return $params[0];

} # End of size_action_1.

# ------------------------------------------------

sub sketch_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sketch_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sketch',
	});

	return $params[0];

} # End of sketch_action_1.

# ------------------------------------------------

sub sketch_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'sketch_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'sketch',
	});

	return $params[0];

} # End of sketch_action_2.

# ------------------------------------------------

sub smush_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'smush_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'smush',
	});

	return $params[0];

} # End of smush_action_1.

# ------------------------------------------------

sub snaps_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'snaps_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'snaps',
	});

	return $params[0];

} # End of snaps_action_1.

# ------------------------------------------------

sub solarize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'solarize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'solarize',
	});

	return $params[0];

} # End of solarize_action_1.

# ------------------------------------------------

sub splice_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'splice_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'splice',
	});

	return $params[0];

} # End of splice_action_1.

# ------------------------------------------------

sub spread_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'spread_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'spread',
	});

	return $params[0];

} # End of spread_action_1.

# ------------------------------------------------

sub statistic_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'statistic_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'statistic',
	});

	return $params[0];

} # End of statistic_action_1.

# ------------------------------------------------

sub stegano_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'stegano_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'stegano',
	});

	return $params[0];

} # End of stegano_action_1.

# ------------------------------------------------

sub stereo_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'stereo_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'stereo',
	});

	return $params[0];

} # End of stereo_action_1.

# ------------------------------------------------

sub storage_type_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'storage_type_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'storage_type',
	});

	return $params[0];

} # End of storage_type_action_1.

# ------------------------------------------------

sub stretch_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'stretch_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'stretch',
	});

	return $params[0];

} # End of stretch_action_1.

# ------------------------------------------------

sub strip_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'strip_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'strip',
	});

	return $params[0];

} # End of strip_action_1.

# ------------------------------------------------

sub stroke_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'stroke_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'stroke',
	});

	return $params[0];

} # End of stroke_action_1.

# ------------------------------------------------

sub strokewidth_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'strokewidth_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'strokewidth',
	});

	return $params[0];

} # End of strokewidth_action_1.

# ------------------------------------------------

sub style_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'style_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'style',
	});

	return $params[0];

} # End of style_action_1.

# ------------------------------------------------

sub subimage_search_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'subimage_search_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'subimage_search',
	});

	return $params[0];

} # End of subimage_search_action_1.

# ------------------------------------------------

sub swap_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'swap_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'swap',
	});

	return $params[0];

} # End of swap_action_1.

# ------------------------------------------------

sub swirl_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'swirl_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'swirl',
	});

	return $params[0];

} # End of swirl_action_1.

# ------------------------------------------------

sub synchronize_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'synchronize_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'synchronize',
	});

	return $params[0];

} # End of synchronize_action_1.

# ------------------------------------------------

sub taint_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'taint_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'taint',
	});

	return $params[0];

} # End of taint_action_1.

# ------------------------------------------------

sub text_font_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'text_font_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'text_font',
	});

	return $params[0];

} # End of text_font_action_1.

# ------------------------------------------------

sub texture_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'texture_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'texture',
	});

	return $params[0];

} # End of texture_action_1.

# ------------------------------------------------

sub threshold_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'threshold_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'threshold',
	});

	return $params[0];

} # End of threshold_action_1.

# ------------------------------------------------

sub thumbnail_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'thumbnail_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'thumbnail',
	});

	return $params[0];

} # End of thumbnail_action_1.

# ------------------------------------------------

sub tile_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tile_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tile',
	});

	return $params[0];

} # End of tile_action_1.

# ------------------------------------------------

sub tile_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tile_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tile',
	});

	return $params[0];

} # End of tile_action_2.

# ------------------------------------------------

sub tile_action_3
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tile_action_3');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tile',
	});

	return $params[0];

} # End of tile_action_3.

# ------------------------------------------------

sub tile_offset_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tile_offset_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tile_offset',
	});

	return $params[0];

} # End of tile_offset_action_1.

# ------------------------------------------------

sub tint_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'tint_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'tint',
	});

	return $params[0];

} # End of tint_action_1.

# ------------------------------------------------

sub title_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'title_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'title',
	});

	return $params[0];

} # End of title_action_1.

# ------------------------------------------------

sub transform_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transform_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transform',
	});

	return $params[0];

} # End of transform_action_1.

# ------------------------------------------------

sub transparent_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transparent_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transparent',
	});

	return $params[0];

} # End of transparent_action_1.

# ------------------------------------------------

sub transparent_color_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transparent_color_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transparent_color',
	});

	return $params[0];

} # End of transparent_color_action_1.

# ------------------------------------------------

sub transpose_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transpose_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transpose',
	});

	return $params[0];

} # End of transpose_action_1.

# ------------------------------------------------

sub transverse_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'transverse_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'transverse',
	});

	return $params[0];

} # End of transverse_action_1.

# ------------------------------------------------

sub treedepth_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'treedepth_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'treedepth',
	});

	return $params[0];

} # End of treedepth_action_1.

# ------------------------------------------------

sub trim_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'trim_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'trim',
	});

	return $params[0];

} # End of trim_action_1.

# ------------------------------------------------

sub type_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'type_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'type',
	});

	return $params[0];

} # End of type_action_1.

# ------------------------------------------------

sub undercolor_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'undercolor_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'undercolor',
	});

	return $params[0];

} # End of undercolor_action_1.

# ------------------------------------------------

sub unique_colors_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'unique_colors_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'unique_colors',
	});

	return $params[0];

} # End of unique_colors_action_1.

# ------------------------------------------------

sub units_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'units_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'units',
	});

	return $params[0];

} # End of units_action_1.

# ------------------------------------------------

sub unsharp_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'unsharp_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'unsharp',
	});

	return $params[0];

} # End of unsharp_action_1.

# ------------------------------------------------

sub unsharp_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'unsharp_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'unsharp',
	});

	return $params[0];

} # End of unsharp_action_2.

# ------------------------------------------------

sub update_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'update_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'update',
	});

	return $params[0];

} # End of update_action_1.

# ------------------------------------------------

sub verbose_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'verbose_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'verbose',
	});

	return $params[0];

} # End of verbose_action_1.

# ------------------------------------------------

sub version_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'version_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'version',
	});

	return $params[0];

} # End of version_action_1.

# ------------------------------------------------

sub view_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'view_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'view',
	});

	return $params[0];

} # End of view_action_1.

# ------------------------------------------------

sub vignette_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'vignette_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'vignette',
	});

	return $params[0];

} # End of vignette_action_1.

# ------------------------------------------------

sub virtual_pixel_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'virtual_pixel_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'virtual_pixel',
	});

	return $params[0];

} # End of virtual_pixel_action_1.

# ------------------------------------------------

sub visual_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'visual_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'visual',
	});

	return $params[0];

} # End of visual_action_1.

# ------------------------------------------------

sub watermark_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'watermark_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'watermark',
	});

	return $params[0];

} # End of watermark_action_1.

# ------------------------------------------------

sub wave_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'wave_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'wave',
	});

	return $params[0];

} # End of wave_action_1.

# ------------------------------------------------

sub wave_action_2
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'wave_action_2');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'wave',
	});

	return $params[0];

} # End of wave_action_2.

# ------------------------------------------------

sub weight_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'weight_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'weight',
	});

	return $params[0];

} # End of weight_action_1.

# ------------------------------------------------

sub white_point_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'white_point_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'white_point',
	});

	return $params[0];

} # End of white_point_action_1.

# ------------------------------------------------

sub white_threshold_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'white_threshold_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'white_threshold',
	});

	return $params[0];

} # End of white_threshold_action_1.

# ------------------------------------------------

sub window_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'window_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'window',
	});

	return $params[0];

} # End of window_action_1.

# ------------------------------------------------

sub window_group_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'window_group_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'window_group',
	});

	return $params[0];

} # End of window_group_action_1.

# ------------------------------------------------

sub write_action_1
{
	my($cache, @params) = @_;

	# We ignore $params[1] since it is just the name of the action.

	$$cache{logger} -> log(debug => 'write_action_1');
	$$cache{items} -> push
	({
		params	=> [map{defined($_) ? $_ : ''} @params[2 .. $#params] ],
		sign	=> $params[0],
		rule	=> 'write',
	});

	return $params[0];

} # End of write_action_1.

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
