#!/usr/bin/env perl

use feature 'say';
use strict;
use warnings;
use warnings qw(FATAL utf8);

use File::Slurper 'read_lines';

use Image::Magick::CommandParser;

# ----------------------------------------------

my($count)		= 0;
my($input_file)	= 'data/synopsis.txt';
my($maxlevel)	= shift || 'info';

for my $command (read_lines($input_file) )
{
	next if ($command =~ /^\s*#/);

	$count++;

	say $count;

	Image::Magick::CommandParser -> new
	(
		command		=> $command,
		maxlevel	=> $maxlevel,
	) -> run;
}
