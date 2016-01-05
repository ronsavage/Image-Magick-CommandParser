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
	my(%lexeme);
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

			if (! $lexeme{$parameters})
			{
				$lexeme{$parameters} = build_parameters($parameters);
			}

			$parameters = join(' ', @{$lexeme{$parameters} });

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

	return [@bnf];

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

	say "Parsing $parameters";

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

				push @lexeme, $1, 'x', $2;
			}
			else
			{
				push @lexeme, $token;
			}
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
		elsif ($token =~ /^\{(?:\+_)\}([a-zA-Z]+)\{(?:\+_)\}([a-zA-Z]+)$/)
		{
			# Note: Code above converted '-' into '_'.
			# Expect:
			# o {+_}tx{+_}ty, for 'annotate'.
			# o {+_}x{+_}y, for 'floodfill'.

			push @lexeme, "plus_or_minus $1 plus_or_minus $2";
		}
		elsif ($token =~ /^([a-zA-Z]+)\{%\}$/)
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
		else
		{
			push @lexeme, $token;
		}
	}

	return [@lexeme];

} # End of build_parameters.

# ----------------------------------------------

sub process_html
{
	my($input_file)	= 'data/command.line.options.html';
	my($root)		= HTML::TreeBuilder -> new();
	my $content		= join(' ', read_lines($input_file) );
	my($result)		= $root -> parse_content($content);
	my(@h3)			= $root -> look_down(_tag => 'h3');
	my($count)		= 0;

	my(@command);
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
			$prefix		= $1;
			$name		= $2;
			$parameters	= $3;
			$parameters	=~ s/^\s+//;
			@field		= split(/((?:-|\+)$name)/, $parameters);

			if ($#field == 0)
			{
				push @command, [$name, $prefix, $parameters];
			}
			else
			{
				while ($parameters = shift @field)
				{
					$parameters =~ s/^\s+//;
					$parameters =~ s/\s+$//;

					push @command, [$name, $prefix, $parameters];

					$name = shift @field;

					if ($name)
					{
						$prefix				= substr($name, 0, 1);
						substr($name, 0, 1)	= '';
					}
				}

				push @command, [$name, $prefix, ''] if ($name);
			}
		}
		else
		{
			die "Unable to find prefix and command: $line";
		}
	}

	$root -> delete();

	return [@command];

} # End of process_html.

# ----------------------------------------------

my($command)		= process_html;
my($bnf)			= build_bnf($command);
my($output_file)	= 'data/command.line.options.bnf';

open(my $fh, '>', $output_file) || die "Can't open(> $output_file): $!";

for (@$bnf)
{
	say $fh $_;
}

close $fh;
