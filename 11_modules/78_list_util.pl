#!/usr/bin/perl
# LESSON 78: List::Util Module
# A core Perl module providing essential list operations

use strict;
use warnings;
use feature 'say';
# Import groups: aggregates, extremes, search, reduce, unique, pairs
use List::Util qw(
    sum sum0 product
    min max minstr maxstr
    first any all none
    reduce
    shuffle uniq
    pairs
);

my @nums  = (5, 3, 8, 1, 9, 2, 7, 4, 6);         # test numbers
my @words = qw(banana apple cherry apple banana date banana);  # with duplicates

say "=== Numeric Aggregates ===";
say "sum    : " . sum(@nums);       # sum() adds all numbers together -> 45
say "sum0   : " . sum0();           # sum0() returns 0 for empty list (sum returns undef)
say "product: " . product(@nums);   # product() multiplies all numbers -> 181440
say "min    : " . min(@nums);       # min() finds the smallest number -> 1
say "max    : " . max(@nums);       # max() finds the largest number  -> 9

say "\n=== String Extremes ===";
say "minstr : " . minstr(@words);   # minstr() finds alphabetically first -> apple
say "maxstr : " . maxstr(@words);   # maxstr() finds alphabetically last  -> date

say "\n=== Searching ===";
my $big = first { $_ > 6 } @nums;           # first() returns the FIRST element where condition is true
say "first > 6    : $big";                   # 8 (first one encountered that exceeds 6)

say "any > 8 ?    : " . (any  { $_ > 8 } @nums ? "yes" : "no");  # any element > 8? yes (9)
say "all > 0 ?    : " . (all  { $_ > 0 } @nums ? "yes" : "no");  # all positive? yes
say "none < 0 ?   : " . (none { $_ < 0 } @nums ? "yes" : "no");  # none negative? yes

say "\n=== reduce (fold/accumulate) ===";
my $factorial = reduce { $a * $b } 1..6;   # $a = accumulator, $b = current element
# runs: 1*2=2, 2*3=6, 6*4=24, 24*5=120, 120*6=720
say "6! = $factorial";   # 720

say "\n=== Unique and Shuffle ===";
my @unique   = uniq @words;             # uniq() removes duplicates, preserves order of first seen
say "Unique: " . join(", ", @unique);   # banana, apple, cherry, date

my @shuffled = shuffle @nums;           # shuffle() returns a random order copy
say "Shuffled: " . join(", ", @shuffled);

say "\n=== pairs (iterate key-value list) ===";
my @data = (a => 1, b => 2, c => 3);   # flat list of pairs
for my $pair (pairs @data) {            # pairs() groups into 2-element array refs
    say "  $pair->[0] => $pair->[1]";   # [0] = key, [1] = value
}
