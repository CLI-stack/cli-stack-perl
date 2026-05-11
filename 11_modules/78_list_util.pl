#!/usr/bin/perl
# LESSON 78: List::Util Module

use strict;
use warnings;
use feature 'say';
use List::Util qw(
    sum sum0 product
    min max minstr maxstr
    first any all none
    reduce
    shuffle uniq uniqstr
    pairs
    sample
);

my @nums = (5, 3, 8, 1, 9, 2, 7, 4, 6);
my @words = qw(banana apple cherry apple banana date banana);

say "=== Numeric ===";
say "sum    : " . sum(@nums);
say "sum0   : " . sum0();        # 0 for empty (sum returns undef)
say "product: " . product(@nums);
say "min    : " . min(@nums);
say "max    : " . max(@nums);

say "\n=== String ===";
say "minstr : " . minstr(@words);
say "maxstr : " . maxstr(@words);

say "\n=== Search ===";
my $big = first { $_ > 6 } @nums;
say "first > 6   : $big";
say "any > 10    : " . (any  { $_ > 10 } @nums ? "yes" : "no");
say "all > 0     : " . (all  { $_ > 0  } @nums ? "yes" : "no");
say "none < 0    : " . (none { $_ < 0  } @nums ? "yes" : "no");

say "\n=== reduce ===";
my $factorial = reduce { $a * $b } 1..6;
say "6! = $factorial";   # 720

say "\n=== Unique ===";
my @unique = uniq @words;
say "Unique words: " . join(", ", @unique);

say "\n=== Shuffle ===";
my @shuffled = shuffle @nums;
say "Shuffled: " . join(", ", @shuffled);

say "\n=== Pairs ===";
my @data = (a => 1, b => 2, c => 3);
for my $pair (pairs @data) {
    say "  $pair->[0] => $pair->[1]";
}
