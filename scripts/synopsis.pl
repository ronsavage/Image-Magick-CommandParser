#!/usr/bin/env perl

use feature 'say';
use strict;
use warnings;
use warnings qw(FATAL utf8);

use Image::Magick::CommandParser;

# ----------------------------------------------

my($command)	= 'convert fd:3 png:fd:4 gif:fd:5 fd:6 -append output.png';
my($processor)	= Image::Magick::CommandParser -> new
(
	command		=> $command,
	maxlevel	=> 'notice',
);

$processor -> run;

say 'Input:  ', $command;
say 'Result: ', $processor -> result;
