#!/usr/bin/env perl

use feature 'say';
use strict;
use warnings;
use warnings qw(FATAL utf8);

use Image::Magick::CommandParser;

# ----------------------------------------------

# Run with an extremely simple command.

Image::Magick::CommandParser -> new
(
#	command		=> 'convert logo: -type Bilevel',
	command		=> 'convert -type Bilevel',
	maxlevel	=> 'debug',
) -> run;
