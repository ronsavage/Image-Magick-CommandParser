#!/usr/bin/env perl

use feature 'say';
use strict;
use warnings;
use warnings qw(FATAL utf8);

use File::Slurper 'read_lines';

use Image::Magick::CommandParser;

# ----------------------------------------------

my($input_file)	= 't/commands.txt';

for my $command (read_lines($input_file) )
{
	Image::Magick::CommandParser -> new
	(
		command		=> $command,
		maxlevel	=> 'debug',
	) -> run;

	print "\n";
}
