#!/usr/bin/perl
# LESSON 27: Sorting Arrays

use strict;
use warnings;
use feature 'say';

my @fruits = qw(banana apple cherry date elderberry);
my @nums   = (5, 2, 8, 1, 9, 3, 7);

# Default sort: alphabetical (string sort)
my @sorted_str = sort @fruits;
say "Alphabetical: " . join(", ", @sorted_str);

# Reverse alphabetical
my @rev_str = sort { $b cmp $a } @fruits;
say "Reverse alpha: " . join(", ", @rev_str);

# Numeric sort (MUST use <=>)
my @sorted_num = sort { $a <=> $b } @nums;
say "Numeric asc : " . join(", ", @sorted_num);

my @sorted_desc = sort { $b <=> $a } @nums;
say "Numeric desc: " . join(", ", @sorted_desc);

# Sort strings by length
my @by_len = sort { length($a) <=> length($b) } @fruits;
say "By length: " . join(", ", @by_len);

# Sort by length, then alphabetically (stable multi-key sort)
my @multi = sort { length($a) <=> length($b) || $a cmp $b } @fruits;
say "By len+alpha: " . join(", ", @multi);

# Sort array of arrays (sort by second element)
my @people = (
    ["Charlie", 30],
    ["Alice",   25],
    ["Bob",     35],
);
my @by_age = sort { $a->[1] <=> $b->[1] } @people;
foreach my $p (@by_age) {
    say "$p->[0]: $p->[1]";
}
