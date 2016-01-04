#!/usr/bin/env perl

use feature 'say';
use integer; # For $x % $y.
use strict;
use warnings;
use warnings qw(FATAL utf8);

use Data::Dumper::Concise;

use File::Slurp; # For read_file().

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

	$max_length += 5; # 5 = length('_rule').

	my(@bnf);
	my($count);
	my($item);
	my($parameters);
	my($sign, $spacer, $s);
	my($token, $token_length, $temp, $tabs4token, $tabs4gap);

	for $option (sort keys %bnf)
	{
		$count = 0;

		for my $i (0 .. $#{$bnf{$option} })
		{
			$count++;

			$item			= $bnf{$option}[$i];
			$sign			= $$item[0] eq '-' ? 'minus_sign' : 'plus_sign';
			$parameters		= $$item[1];
			$token			= $option =~ s/-/_/gr;
			$token_length	= length "${token}_word";

			if ($count == 1)
			{
				$temp		= $max_length - $token_length;
				$tabs4gap	= int($temp / 4) + ($temp % 4 == 0 ? 0 : 1);
				$spacer		= "\t" x $tabs4gap; # Perl needs \t before ::=, so subtract 1.
				$s			= "${token}_rule$spacer\t::= $sign ${token}_word $parameters\t action => ${token}_action_$count";
			}
			else
			{
				$tabs4token	= int($max_length / 4) + ($max_length % 4 == 0 ? 0 : 1);
				$temp		= $max_length - $token_length;
				$tabs4gap	= int($temp / 4) + ($temp % 4 == 0 ? 0 : 1);
				$spacer		= "\t" x ($tabs4token + $tabs4gap - 1);
				$s			= "$spacer\t| $sign ${token}_word $parameters\t action => ${token}_action_$count";
			}

			$s .= "\n" if ($count == $#{$bnf{$option} } + 1);

			push @bnf, $s;
		}
	}

	return [@bnf];

} # End of build_bnf.

# ----------------------------------------------

sub process_html
{
	my($input_file)	= 'data/command.line.options.html';
	my($root)		= HTML::TreeBuilder -> new();
	my $content		= read_file($input_file, binmode => ':utf8');
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

sub process_parameters
{
	my($lines) = @_;

	my($count, @command);
	my(@field, $field);
	my(@parameters);
	my($temp, @temp);

	for my $line (@$lines)
	{
		if ($$line[2] =~ /\[/)
		{
			# Expect:
			# (Keep together)
			# o host:display[.screen]
			# o sx,rx,ry,sy[,tx,ty]
			# (Nested)
			# o Width[xHeight[+Angle]]
			# (Simple)
			# o radius[xsigma]
			# (Multiple)
			# o media[offset][{^!<>}]

			$count		= 0;
			@field		= split(/(\[)/, $$line[2]);
			@parameters	= ();

			while ($field = shift @field)
			{
				$count++;

				if ($field =~ /^XdegreesxYdegrees/)
				{
					@temp = split(/(x)/, $field);

					push @parameters, join(' ', @temp);
				}
				elsif ($count == 1)
				{
					push @parameters, $field;
				}
				elsif ( ($field eq '[') && ($field[0] =~ /^[.,]/) )
				{	# Keep together.
					push @parameters, $field . shift @field;
				}
				elsif ( ($field eq '[') && ($field[$#field] =~ /]]$/) )
				{	# Nested.

					$temp = 'x ' . substr(shift @field, 1) . ' ' . join('', @field);

					push @parameters, "$field$temp";

					@field = ();
				}
				elsif ( ($field eq '[') && ($field[0] =~ /^x/) )
				{	# Simple.

					$temp = 'x ' . substr(shift @field, 1);

					push @parameters, "$field$temp";

					@field = ();
				}
				elsif ($field eq '[')
				{
					push @parameters, $field . shift @field;
				}
			}

			push @command, [$$line[0], $$line[1], join(' ', @parameters)];
		}
		else
		{
			push @command, $line;
		}
	}

	return [@command];

} # End of process_parameters.

# ----------------------------------------------

my($command)		= process_html;
$command			= process_parameters($command);
my($bnf)			= build_bnf($command);
my($output_file)	= 'data/command.line.options.bnf';

open(my $fh, '>', $output_file) || die "Can't open(> $output_file): $!";

for (@$bnf)
{
	say $fh $_;
}

close $fh;
