#!/usr/bin/env perl

use feature 'say';
use strict;
use warnings;
use warnings qw(FATAL utf8);

use Image::Magick::CommandParser;

# ----------------------------------------------

Image::Magick::CommandParser -> new(maxlevel => 'debug') -> run;
