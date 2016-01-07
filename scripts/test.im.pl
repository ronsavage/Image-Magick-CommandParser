#!/usr/bin/env perl

use strict;
use warnings;

use File::Slurper 'read_lines';

use Marpa::R2;

use Try::Tiny;

# ------------------------------------------------

sub adaptive_blur_action_1
{
	my($cache, @params) = @_;

	print "adaptive_blur_action_1. \n";
	print "params: ", join(', ', @params), ". \n";

	return $params[0];

} # End of adaptive_blur_action_1.

# ------------------------------------------------

sub font_action_1
{
	my($cache, @params) = @_;

	print "font_action_1. \n";
	print "params: ", join(', ', @params), ". \n";

	return $params[0];

} # End of font_action_1.

# ------------------------------------------------

sub input_file_action
{
	my($cache, @params) = @_;

	print "input_file_action. \n";
	print "params: ", join(', ', @params), ". \n";

	return $params[0];

} # End of input_file_action.

# ------------------------------------------------

sub size_action_1
{
	my($cache, @params) = @_;

	print "size_action_1. \n";
	print "params: ", join(', ', map{defined($_) ? $_ : 'undef'} @params), ". \n";

	return $params[0];

} # End of size_action_1.

# ------------------------------------------------

my($bnf) = <<'EOS';

:default								::= action => ::first

lexeme default							= latm => 1		# Longest Acceptable Token Match.

# G1-level rules.

:start									::= command_and_options

command_and_options						::= command_name input_file_name option_rule_set

command_name							::= convert_command

input_file_name							::= path_string	action => input_file_action
input_file_name							::=				action => input_file_action

option_rule_set							::= option_rule+

option_rule								::= adaptive_blur_rule
											| font_rule
											| size_rule

adaptive_blur_rule						::= minus_sign adaptive_blur_word radius	action => adaptive_blur_action_1

radius									::= string

font_rule								::= minus_sign font_word name	action => font_action_1

name									::= string

size_rule								::= minus_sign size_word width optional_canvas_palette 	action => size_action_1

width									::= string

optional_canvas_palette					::= path_string*

adaptive_blur_word						~ 'adaptive_blur'

convert_command							~ 'convert'

font_word								~ 'font'

minus_sign								~ '-'

size_word								~ 'size'

# L0 lexemes for the boilerplate.

path_string								~ path_set+
path_set								~ [^-\s]

string									~ char_set+
char_set								~ [^\s]

:discard								~ whitespace
whitespace								~ [\s]+

EOS

my(%count)		= (in => 0, success => 0);
my($g)			= Marpa::R2::Scanless::G -> new({source => \$bnf});
my($input_file)	= 't/commands.txt';

my($input);
my($parser);
my($result);
my($value);
my($work);

for my $command (read_lines($input_file) )
{
	$count{in}++;

	$work	= ['OK', $command];
	$result = $$work[0];
	$input  = $$work[1];

	print "In count: $count{in}:\nInput:  ->$input<- Expected result: $result\n";

	$parser = Marpa::R2::Scanless::R->new
	({
		grammar				=> $g,
		semantics_package	=> 'main',
		#trace_terminals		=> 99,
	});

	try
	{
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
