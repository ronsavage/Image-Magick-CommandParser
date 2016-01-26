#!/usr/bin/env perl

use feature 'say';
use strict;
use warnings;
use warnings qw(FATAL utf8);

use Set::Array;

use Set::FA::Element;

my($stack) = Set::Array -> new;

# ----------------------------------------------

sub command
{
	my($dfa)	= @_;
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> 'command',
	});

	print "'command' matched '", $dfa -> match, "'\n";

} # End of command.

# ----------------------------------------------

sub done
{
	my($dfa)	= @_;
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> 'done',
	});

	print "'done' matched '", $dfa -> match, "'\n";

} # End of done.

# ----------------------------------------------

sub input_file
{
	my($dfa)	= @_;
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> 'input_file',
	});

	print "'input_file' matched '", $dfa -> match, "'\n";

} # End of input_file.

# ----------------------------------------------

sub output_file
{
	my($dfa)	= @_;
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> 'output_file',
	});

	print "'output_file' matched '", $dfa -> match, "'\n";

} # End of output_file.

# ----------------------------------------------

my($dfa) = Set::FA::Element -> new
(
	accepting	=> ['done'],
	actions		=>
	{
		command =>
		{
			entry	=> \&command,
		},
		done =>
		{
			entry	=> \&done,
		},
		input_file =>
		{
			entry	=> \&input_file,
		},
		output_file =>
		{
			entry	=> \&output_file,
		},
	},
	die_on_loop	=> 1,
	maxlevel	=> 'debug',
	start		=> 'start',
	transitions	=>
	[
		['start',		'convert|mogrify',				'command'],
		['command',		'[a-zA-Z][-a-zA-Z]+:',			'input_file'],
		['command',		'[a-zA-Z][-a-zA-Z]+:[a-zA-Z]+',	'input_file'],
		['input_file',	'.+.png',						'output_file'],
		['output_file',	'^$',							'done'],
		['done',		'.',							'done'],
	],
);

$dfa -> step('convert logo:');

print map{"token => $$_{token}. type => $$_{type}.\n\n"} $stack -> print;
