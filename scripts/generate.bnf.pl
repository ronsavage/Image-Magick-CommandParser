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
	my($lines)		= @_;
	my($max_length)	= 0;

	my(%bnf);
	my($option);

	for my $line (@$lines)
	{
		$option			= $$line[0];
		$bnf{$option}	= [] if (! $bnf{$option});
		$max_length		= length($option) if (length($option) > $max_length);

		push @{$bnf{$option}}, [$$line[1], $$line[2] ];
	}

	$max_length		+= 5; # 5 = length('_rule').
	my($total_tabs)	= ($max_length / 4) + ($max_length % 4 == 0 ? 1 : 2);

	my(@bnf);
	my($count);
	my($item);
	my(%lexemes);
	my($parameters);
	my($sign, $spacer, $s);
	my($token, $token_length, $tab_count);

	for $option (sort keys %bnf)
	{
		$count = 0;

		for my $i (0 .. $#{$bnf{$option} })
		{
			$count++;

			$item			= $bnf{$option}[$i];
			$sign			= $$item[0] eq '-' ? 'minus_sign' : 'plus_sign';
			$parameters		= $$item[1] =~ s/-/_/gr;
			$token			= $option =~ s/-/_/gr;
			$token_length	= length "${token}_word";

			if (! $lexemes{$parameters})
			{
				$lexemes{$parameters} = build_parameters($parameters);
			}

			$parameters = join(' ', @{$lexemes{$parameters} });

			if ($count == 1)
			{
				$tab_count	= ($token_length / 4) + 1;
				$spacer		= "\t" x ($total_tabs - $tab_count - 1); # Perl needs \t before ::=.
				$s			= "${token}_rule$spacer\t::= $sign ${token}_word $parameters\t action => ${token}_action_$count";
			}
			else
			{
				$spacer		= "\t" x ($total_tabs - 1);
				$s			= "$spacer\t| $sign ${token}_word $parameters\t action => ${token}_action_$count";
			}

			$s .= "\n" if ($count == $#{$bnf{$option} } + 1);

			push @bnf, $s;
		}
	}

	return (\@bnf, \%lexemes);

} # End of build_bnf.

# ----------------------------------------------

sub build_parameters
{
	my($parameters)		= @_;
	my(%special_words)	=
	(	# These contain 'x'.
		expression	=> 1,
		indexes		=> 1,
		text		=> 1,
	);

	my(@field);
	my($infix);
	my(@lexeme);
	my($prefix);
	my($suffix);

	for my $token (split(/\s+/, $parameters) )
	{
		if ($token =~ /^([_a-zA-Z]+)$/)
		{
			if ($special_words{$token})
			{
				push @lexeme, $token;
			}
			elsif ($token =~ /(.+)x(.+)/)
			{
				# Expect, for 'annotate':
				# o XdegreesxYdegrees.

				push @lexeme, $1, 'string', $2;
			}
			else
			{
				push @lexeme, $token;
			}
		}
		elsif ($token =~ /^\{([<>])}$/)
		{
			# Expect:
			# o ticks x ticks_per_second {<} {>}, for 'delay'.

			push @lexeme, $1 eq '<' ? 'optional_less_than' : 'optional_greater_than';
		}
		elsif ($token =~ /^([a-zA-Z]+)\(s\)$/)
		{
			# Expect:
			# o index(s), for 'clone'.

			push @lexeme, "$1es";
		}
		elsif ($token =~ /^([a-zA-Z]+)\{<}\{>}$/)
		{
			# Expect:
			# o degrees{<}{>}, for 'rotate'.

			push @lexeme, "$1 less_than greater_than";
		}
		elsif ($token =~ /^([_a-zA-Z]+),([_a-zA-Z]+)$/)
		{
			# Expect:
			# o x,y, for 'blue_primary'.

			push @lexeme, "$1 comma $2";
		}
		elsif ($token =~ /^\+([_a-zA-Z]+)\{\+([_a-zA-Z]+)}$/)
		{
			# Expect:
			# o +x{+y}, for 'stereo'.

			push @lexeme, "plus $1 plus $2";
		}
		elsif ($token eq 'host:display[.screen]')
		{
			push @lexeme, 'host_display_optional_dot_screen';
		}
		elsif ($token =~ /^([_,a-zA-Z]+)\[([_,a-zA-Z]+)\]$/)
		{
			# Expect:
			# o radius[xsigma], for 'adaptive_blur'.
			# o sx,rx,ry,sy[,tx,ty], for 'affine'.

			$field[0]	= $1;
			$field[1]	= $2;

			if ($field[1] =~ /^x(.+)/)
			{
				push @lexeme, "$field[0]_optional_x_$1";
			}
			else
			{
				# Note: the 2nd split has a leading ','.
				# Hence not "...optional_$suffix".

				$prefix	= join('_', split(/,/, $field[0]) );
				$suffix	= join('_', split(/,/, $field[1]) );

				push @lexeme, "${prefix}_optional$suffix";
			 }
		}
		elsif ($token =~ /^([a-zA-Z]+)\[x([a-zA-Z]+)\]\[\+([a-zA-Z]+)\]$/)
		{
			# Expect:
			# o width[xheight][+offset], for 'size'.

			push @lexeme, "$1 optional_x_$2 optional_plus_$3";
		}
		elsif ($token =~ /^([a-zA-Z]+)\[([a-zA-Z]+)\]\[(.+)\]$/)
		{
			# Expect:
			# o media[offset][{^!<>}], for 'page'.

			push @lexeme, "$1 optional_$2 optional_geometry_suffix";
		}
		elsif ($token =~ /^([a-zA-Z]+)\[x([a-zA-Z]+)\[\+([a-zA-Z]+)\]\]$/)
		{
			# Expect:
			# o Width[xHeight[+Angle]], for 'blur'.

			$field[0]	= lc $1;
			$field[1]	= lc $2;
			$field[2]	= lc $3;

			push @lexeme, "$field[0] optional_x_$field[1]_optional_plus_$field[2]";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)\+([a-zA-Z]+)$/)
		{
			# Expect:
			# o radiusxsigma+angle, for 'motion-blur'.

			push @lexeme, "$1 x $2 plus $3";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)\{\+([a-zA-Z]+)\{%}}$/)
		{
			# Expect:
			# o widthxheight{+distance{%}}, for 'mean_shift'.

			push @lexeme, "$1 x $2 optional_plus_$3_optional_percent";
		}
		elsif ($token =~ /^(?:\{\+_})([a-zA-Z]+)(?:\{\+_})([a-zA-Z]+)$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o {+_}tx{+_}ty, for 'annotate'.
			# o {+_}x{+_}y, for 'floodfill'.

			push @lexeme, "plus_or_minus $1 plus_or_minus $2";
		}
		elsif ($token =~ /^([a-zA-Z]+)\{%}$/)
		{
			# Expect:
			# o value{%}, for 'bias'.

			push @lexeme, "$1 optional_percent";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)\{\+([_a-zA-Z]+)}\{\+([_a-zA-Z]+)}$/)
		{
			# Expect:
			# o radiusxsigma{+lower_percent}{+upper_percent}, for 'canny'.

			push @lexeme, "$1 x $2 optional_$3 optional_$4";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)\{\+([_a-zA-Z]+)}$/)
		{
			# Expect:
			# o widthxheight{+threshold}, for 'hough_lines'.

			push @lexeme, "$1 x $2 optional_$3";
		}
		elsif ($token =~ /^([a-zA-Z]+)x([a-zA-Z]+)(?:\{\+_})([_a-zA-Z]+)\{%}$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o widthxheight{+_}offset{%}, for 'lat'.

			push @lexeme, "$1 x $2 plus_or_minus $3 optional_percent";
		}
		elsif ($token =~ /^([_a-zA-Z]+)\{,([_a-zA-Z]+)}\{%}\{,([_a-zA-Z]+)}$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o black_point{,white_point}{%}{,gamma}, for 'level'.

			push @lexeme, "$1 comma $2 optional_percent comma $3";
		}
		elsif ($token =~ /^\{([_a-zA-Z]+)}\{,}\{([_a-zA-Z]+)}$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o {black_color}{,}{white_color}, for 'level_colors'.

			push @lexeme, "$1 comma $2";
		}
		elsif ($token =~ /^([_a-zA-Z]+)\{x([_a-zA-Z]+)}\{%}}$/)
		{
			# Warning: Fake '}}' instead of '}' at end of regexp.
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o brightness{xcontrast}{%}, for 'brightness_contrast'.
			# o black_point{xwhite_point}{%}, for 'contrast_stretch'.

			push @lexeme, "$1 optional_x_$2 optional_percent";
		}
		elsif ($token =~ /^([_a-zA-Z]+)\{x([a-zA-Z]+)}(?:\{\+_})([a-zA-Z]+)(?:\{\+_})([a-zA-Z]+)\{%}$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o percent_opacity{xsigma}{+_}x{+_}y{%}, for 'shadow'.
			# o radius{xsigma}{+_}x{+_}y{%}, for 'vignette'.

			push @lexeme, "$1 optional_x_$2 plus_or_minus $3 plus_or_minus $4 optional_percent";
		}
		elsif ($token =~ /^([a-zA-Z]+)\{@}\{!}$/)
		{
			# Expect:
			# o geometry{@}{!}, for 'crop'.

			push @lexeme, "$1 optional_at_sign optional_exclamation_point";
		}
		else
		{
			push @lexeme, $token;
		}
	}

	return [@lexeme];

} # End of build_parameters.

# ----------------------------------------------

sub format_bnf
{
	my($bnf, $lexemes) = @_;
	my($max_length)		= 0;

	my(%seen);

	for my $value (values %$lexemes)
	{
		for my $lexeme (@$value)
		{
			for my $token (split(/\s/, $lexeme) )
			{
				if (! $seen{$lexeme})
				{
					$seen{$token}	= 1;
					$max_length		= length($token) if (length($token) > $max_length);
				}
			}
		}
	}

	my(%lexeme_value) =
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
		color									=> 'color',
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
		gamma									=> 'real_number',
		geometry								=> 'geometry_string',
		greater_than							=> "'>'",
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
		kernel									=> 'comma_separated_real_numbers',
		key										=> 'string',
		less_than								=> "'<'",
		levels									=> 'comma_separated_integers',
		low										=> 'real_number',
		matrix									=> 'string',
		media									=> 'string',
		method									=> 'string',
		mid_point								=> 'integer',
		name									=> 'string',
		offset									=> 'offset_list',
		operator								=> 'string',
		optional_at_sign						=> 'string',
		optional_exclamation_point				=> 'string',
		optional_gain							=> 'string',
		optional_geometry_suffix				=> 'string',
		optional_greater_than					=> 'string',
		optional_less_than						=> 'string',
		optional_lower_percent					=> 'string',
		optional_offset							=> 'string',
		optional_percent						=> 'string',
		optional_plus_distance_optional_percent	=> 'string',
		optional_plus_offset					=> 'string',
		optional_threshold						=> 'string',
		optional_upper_percent					=> 'string',
		optional_x_contrast						=> 'string',
		optional_x_height						=> 'string',
		optional_x_height_optional_plus_angle	=> 'string',
		optional_x_sigma						=> 'string',
		optional_x_white_point					=> 'string',
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
		radius_optional_x_sigma					=> 'real_number',
		saturation								=> 'real_number',
		seconds									=> 'integer',
		sigma									=> 'real_number',
		smoothing_threshold						=> 'real_number',
		src_percent_optional_x_dst_percent		=> 'real_number',
		string									=> '[a-zA-Z]+',
		sx_rx_ry_sy_optional_tx_ty				=> 'comma_separated_real_numbers',
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
		white_point								=> 'string',
		width									=> 'real_number',
		x										=> 'integer',
		Xdegrees								=> 'real_number',
		Xdegrees_optional_x_Ydegrees			=> 'real_number',
		y										=> 'integer',
		Ydegrees								=> 'real_number',
	);
	my($total_tabs) = ($max_length / 4) + ($max_length % 4 == 0 ? 1 : 2);

	my($spacer);
	my($token_length, $tab_count);

	for my $lexeme (sort{lc $a cmp lc $b} keys %seen)
	{
		$token_length	= length($lexeme);
		$tab_count		= ($token_length / 4) + 1;
		$spacer			= "\t" x ($total_tabs - $tab_count - 1);

		die "Unknown lexeme '$lexeme'\n" if (! $lexeme_value{$lexeme});

		push @$bnf, "$lexeme$spacer\t~ $lexeme_value{$lexeme}\n";
	}

	save_bnf($bnf);

} # End of format_bnf.

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
	my($prefix, $parameters);
	my($s);

	for my $h3 (@h3)
	{
		$count++;

		$line	= $h3 -> as_text || '-';
		$line	=~ s/\s\s+/ /g;
		$s		= $line =~ s/^\s+//r;
		$s		=~ s/\s+$//;

		if ($s =~ /^(-|\+)([^\s]+)(.*)/)
		{
			$prefix	= $1;
			$name	= $2;

			# Abandon some cases.

			next if ($name =~ /define|distort|morphology|ordered-dither|poly|sparse-color/);

			$parameters	= $3;
			$parameters	=~ s/^\s+//;
			@field		= split(/((?:-|\+)$name)/, $parameters);

			if ($#field == 0)
			{
				push @$command, [$name, $prefix, $parameters];
			}
			else
			{
				while ($parameters = shift @field)
				{
					$parameters =~ s/^\s+//;
					$parameters =~ s/\s+$//;

					push @$command, [$name, $prefix, $parameters];

					$name = shift @field;

					if ($name)
					{
						$prefix				= substr($name, 0, 1);
						substr($name, 0, 1)	= '';
					}
				}

				push @$command, [$name, $prefix, ''] if ($name);
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
		$lexeme		= $$item[0];
		$max_length = length($lexeme) if (length($lexeme) > $max_length);

	}

	my($total_tabs) = ($max_length / 4) + ($max_length % 4 == 0 ? 1 : 2);

	my($spacer);
	my($token_length, $tab_count);

	open(my $fh, '>', $output_file) || die "Can't open(> $output_file): $!";

	for my $item (@$command)
	{
		$lexeme			= $$item[0];
		$token_length	= length($lexeme);
		$tab_count		= ($token_length / 4);
		$spacer			= "\t" x ($total_tabs - $tab_count - 1);

		say $fh "$lexeme$spacer\t$$item[1]\t$$item[2]";
	}

	close $fh;

} # End of save_raw_commands.

# ----------------------------------------------

my($command)		= process_html;
my($bnf, $lexemes)	= build_bnf($command);

format_bnf($bnf, $lexemes);
