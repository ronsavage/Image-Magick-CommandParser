#!/usr/bin/env perl

use feature 'say';
use strict;
use warnings;
use warnings qw(FATAL utf8);

use Image::Magick::CommandParser;

# ----------------------------------------------

my($command)	= 'convert colors/*s*.png -append output.png';
my($processor)	= Image::Magick::CommandParser -> new
(
	command		=> $command,
	maxlevel	=> 'notice',
);

$processor -> run;

say 'Input:  ', $command;
say 'Result: ', $processor -> result;
