#!/bin/bash

#echo Running generate.bnf.pl

perl scripts/generate.bnf.pl

#echo Running synopsis.pl

perl -Ilib scripts/synopsis.pl
