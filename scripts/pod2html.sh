#!/bin/bash
#
# $DR is my web server's doc root within Debian's RAM disk :-).
# The latter is at /run/shm, so $DR is /run/shm/html.

DIR=Perl-modules/html/Set
FILE=FA

mkdir -p $DR/$DIR/$FILE
mkdir -p ~/savage.net.au/$DIR/$FILE

pod2html.pl -i lib/Set/$FILE.pm         -o ~/savage.net.au/$DIR/$FILE.html
pod2html.pl -i lib/Set/$FILE/Element.pm -o ~/savage.net.au/$DIR/$FILE/Element.html

cp -r ~/savage.net.au/$DIR/* $DR/$DIR
