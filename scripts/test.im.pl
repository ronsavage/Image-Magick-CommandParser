#!/usr/bin/env perl

use strict;
use warnings;

use File::Slurper 'read_lines';

use Marpa::R2;

use Try::Tiny;

# ------------------------------------------------

sub adaptive_blur_1
{
	my($cache, @params) = @_;

	print "adaptive_blur_1. \n";
	print "params: ", join(', ', @params), ". \n";

	return $params[0];

} # End of adaptive_blur_1.

# ------------------------------------------------

sub close_parenthesis
{
	my($cache, @params) = @_;

	print "close_parenthesis. \n";
	print "params: ", join(', ', map{defined($_) ? $_ : 'undef'} @params), ". \n";

	return $params[0];

} # End of close_parenthesis.

# ------------------------------------------------

sub command
{
	my($cache, @params) = @_;

	print "command. \n";
	print "params: ", join(', ', @params), ". \n";

	return $params[0];

} # End of command.

# ------------------------------------------------

sub font_1
{
	my($cache, @params) = @_;

	print "font_1. \n";
	print "params: ", join(', ', @params), ". \n";

	return $params[0];

} # End of font_1.

# ------------------------------------------------

sub input_file
{
	my($cache, @params) = @_;

	print "input_file. \n";
	print "params: ", join(', ', @params), ". \n";

	return $params[0];

} # End of input_file.

# ------------------------------------------------

sub open_parenthesis
{
	my($cache, @params) = @_;

	print "open_parenthesis. \n";
	print "params: ", join(', ', map{defined($_) ? $_ : 'undef'} @params), ". \n";

	return $params[0];

} # End of open_parenthesis.

# ------------------------------------------------

sub size_1
{
	my($cache, @params) = @_;

	print "size_1. \n";
	print "params: ", join(', ', map{defined($_) ? $_ : 'undef'} @params), ". \n";

	return $params[0];

} # End of size_1.

# ------------------------------------------------

my($bnf) = <<'EOS';

:default								::= action => ::first

lexeme default							= latm => 1		# Longest Acceptable Token Match.

# G1-level rules.

:start									::= command_and_options

command_and_options						::= command_name input_file_name option_rule_set

command_name							::= 'convert'	action => command
											| 'mogrify'	action => command

input_file_name							::= path_string	action => input_file
input_file_name							::=				action => input_file

option_rule_set							::= option_rule*

option_rule								::= open_parenthesis
											| close_parenthesis
											| adaptive_blur_rule
											| font_rule
											| size_rule

adaptive_blur_rule						::= minus_sign adaptive_blur_word radius	action => adaptive_blur_1

radius									::= string

font_rule								::= minus_sign font_word name	action => font_1

name									::= string

size_rule								::= minus_sign size_word width optional_canvas_palette 	action => size_1

width									::= string

optional_canvas_palette					::= path_string*

close_parenthesis						::= ')'	action => close_parenthesis

open_parenthesis						::= '('	action => open_parenthesis

adaptive_blur_word						~ 'adaptive_blur'

font_word								~ 'font'

minus_sign								~ '-'

size_word								~ 'size'

# L0 lexemes for the boilerplate.

path_string								~ path_set+
path_set								~ [^-+\s]

string									~ char_set+
char_set								~ [^\s]

:discard								~ whitespace
whitespace								~ [\s]+

EOS

my(%count)		= (in => 0, success => 0);
my($g)			= Marpa::R2::Scanless::G -> new({source => \$bnf});
my($input_file)	= 't/samples.1.txt';

my($input);
my($parser);
my($result);
my($value);
my($work);

for my $command (read_lines($input_file) )
{
	next if ($command =~ /^\s*#/);

	$count{in}++;

	$work	= ['OK', $command];
	$result = $$work[0];
	$input  = $$work[1];

	print "In count: $count{in}:\nInput:  ->$input<- Expected result: $result\n";

	$parser = Marpa::R2::Scanless::R->new
	({
		grammar				=> $g,
		semantics_package	=> 'main',
		#trace_terminals	=> 99,
	});

	try
	{
		$input =~ s/([a-z]+)-([a-z]+)/$1_$2/;

		$parser -> read(\$input);

		print "Ambiguous parse!\n" if ($parser -> ambiguity_metric() > 1);

		$value = $parser -> value;

		if (! defined $value)
		{
			print "Parse failure!\n";
		}
		else
		{
			$count{success}++;

			print "Success count: $count{success}. \n";
		}
	}
	catch
	{
		print "Exception: $_";
	};

	print "\n";
}

print 'Counts: ', join('. ', map{"$_ => $count{$_}"} sort keys %count), ". \n";
