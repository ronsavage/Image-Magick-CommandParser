#!/usr/bin/env perl

use feature 'say';
use strict;
use warnings;
use warnings qw(FATAL utf8);

# ----------------------------------------------

my($list) = [map{chomp; $_} `convert -list list`];

#chomp @$list;

my(%list);

for my $item (@$list)
{
	$list{$item} = [map{chomp; $_} `convert -list $item`];

	chomp @{$list{$list} };
}

for my $list (sort keys %list)
{
	say "$list:";
	say "\t$_" for @{$list{$list} };
}
