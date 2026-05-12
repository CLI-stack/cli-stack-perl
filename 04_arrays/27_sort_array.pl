#!/usr/bin/perl
# LESSON 27: Sorting Arrays
# sort() can sort alphabetically, numerically, or by any custom rule

use strict;
use warnings;
use feature 'say';

my @fruits = qw(banana apple cherry date elderberry);  # qw = quote words
my @nums   = (5, 2, 8, 1, 9, 3, 7);                   # unsorted numbers

# Default sort - alphabetical (compares strings)
my @sorted_str = sort @fruits;
say "Alphabetical: " . join(", ", @sorted_str);   # apple, banana, cherry...

# Reverse alphabetical - swap $a and $b
my @rev_str = sort { $b cmp $a } @fruits;          # $a and $b are special sort variables
say "Reverse alpha: " . join(", ", @rev_str);       # cmp compares strings

# Numeric sort - MUST use <=> (spaceship) not cmp
my @sorted_num = sort { $a <=> $b } @nums;          # $a <=> $b = ascending numeric
say "Numeric asc : " . join(", ", @sorted_num);

my @sorted_desc = sort { $b <=> $a } @nums;         # swap $a/$b for descending
say "Numeric desc: " . join(", ", @sorted_desc);

# Sort strings by their LENGTH
my @by_len = sort { length($a) <=> length($b) } @fruits;   # length() of each word
say "By length: " . join(", ", @by_len);

# Multi-key sort: first by length, then alphabetically if lengths are equal
my @multi = sort { length($a) <=> length($b) || $a cmp $b } @fruits;
# || means: if first comparison is 0 (tie), use second comparison
say "By len+alpha: " . join(", ", @multi);

# Sort an array of arrays by a specific column
my @people = (
    ["Charlie", 30],   # each element is an array reference
    ["Alice",   25],
    ["Bob",     35],
);
my @by_age = sort { $a->[1] <=> $b->[1] } @people;  # sort by the second column (age)
foreach my $p (@by_age) {
    say "$p->[0]: $p->[1]";   # $p->[0] = name, $p->[1] = age
}
