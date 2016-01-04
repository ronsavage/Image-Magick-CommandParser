#!/bin/bash
#
# $DR is my web server's doc root within Debian's RAM disk :-).
# The latter is at /run/shm, so $DR is /run/shm/html.

DIR=Perl-modules/html/Image/Magick
FILE=CommandParser

mkdir -p $DR/$DIR ~/savage.net.au/$DIR

pod2html.pl -i lib/Image/Magick/$FILE.pm -o $DR/$DIR/$FILE.html

cp -r $DR/$DIR/$FILE.html ~/savage.net.au/$DIR
