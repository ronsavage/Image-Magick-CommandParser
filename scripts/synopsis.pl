#!/usr/bin/env perl

use feature 'say';
use strict;
use warnings;
use warnings qw(FATAL utf8);

use Set::Array;

use Set::FA::Element;

my($stack) = Set::Array -> new;

# ----------------------------------------------

sub action
{
	my($dfa)	= @_;
	my($name)	= 'action';
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	print "'$name' matched '", $dfa -> match, "'\n";

} # End of action.

# ----------------------------------------------

sub command
{
	my($dfa)	= @_;
	my($name)	= 'command';
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	print "'$name' matched '", $dfa -> match, "'\n";

} # End of command.

# ----------------------------------------------

sub done
{
	my($dfa)	= @_;
	my($name)	= 'done';
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	print "'$name' matched '", $dfa -> match, "'\n";

} # End of done.

# ----------------------------------------------

sub input_file
{
	my($dfa)	= @_;
	my($name)	= 'input_file';
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	print "'$name' matched '", $dfa -> match, "'\n";

} # End of input_file.

# ----------------------------------------------

sub output_file
{
	my($dfa)	= @_;
	my($name)	= 'output_file';
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	print "'$name' matched '", $dfa -> match, "'\n";

} # End of output_file.

# ----------------------------------------------

sub parameter
{
	my($dfa)	= @_;
	my($name)	= 'parameter';
	my($match)	= $dfa -> match;

	$stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	print "'$name' matched '", $dfa -> match, "'\n";

} # End of parameter.

# ----------------------------------------------

my($dfa) = Set::FA::Element -> new
(
	accepting	=> ['done'],
	actions		=>
	{
		action =>
		{
			entry	=> \&action,
		},
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
		parameter =>
		{
			entry	=> \&parameter,
		},
	},
	die_on_loop	=> 1,
	maxlevel	=> 'debug',
	start		=> 'start',
	transitions	=>
	[
		['start',		'convert|mogrify',				'command'],

		['command',		'^$',							'done'],
		['command',		'[a-zA-Z][-a-zA-Z]+:[a-zA-Z]*',	'input_file'],

		['input_file',	'^$',							'done'],
		['input_file',	'(?:[-+])[a-zA-Z]+',			'action'],
		['input_file',	'.+.png',						'output_file'],

		['action',		'^$',							'done'],
		['action',		'\d+x\d+',						'parameter'],

		['parameter',	'^$',							'done'],
		['parameter',	'(?:[-+])[a-zA-Z]+',			'action'],
		['parameter',	'.+.png',						'output_file'],

		['output_file',	'^$',							'done'],

		['done',		'^$',							'done'],
	],
);

my(@candidate) =
(
	'convert logo:',
	'convert logo: output.png',
	'convert logo: -size 320x85 output.png',
	'convert logo: -size 320x85 -shade 110x90 output.png',
);

my($count, $candidate);
my(@field);

for my $i (0 .. $#candidate)
{
	next if ($i != 3);

	$count		= 0;
	$candidate	= $candidate[$i];
	@field		= split(/\s+/, $candidate);

	print "Processing $candidate\n";

	for my $field (@field)
	{
		print "\tField: $field\n";

		$dfa -> step($field);
	}
}

print "At end: \n";
print 'Current state: ', $dfa -> current, "\n";
print "Processed $candidate\n";
print map{"token => $$_{token}. type => $$_{type}.\n"} $stack -> print;
