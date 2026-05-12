#!/usr/bin/perl
# LESSON 29: map - Transform Every Element in an Array
# map applies a block of code to each element and returns a NEW array of results

use strict;
use warnings;
use feature 'say';

# map { transformation } @array
# $_ holds the current element; the block's result becomes the new element
my @nums = (1..5);   # array: 1, 2, 3, 4, 5

my @doubled = map { $_ * 2 } @nums;    # multiply each element by 2
say "Doubled: " . join(", ", @doubled); # prints: 2, 4, 6, 8, 10

my @squared = map { $_ ** 2 } @nums;   # square each element
say "Squared: " . join(", ", @squared); # prints: 1, 4, 9, 16, 25

# map on strings
my @words = qw(hello world perl);
my @upper = map { uc($_) } @words;      # uc() uppercases each word
say "Upper: " . join(", ", @upper);     # HELLO, WORLD, PERL

# map to add a prefix/path to each filename
my @files = qw(file1 file2 file3);
my @paths = map { "/home/user/$_" } @files;   # prepend path to each name
say "Paths:";
say "  $_" for @paths;                          # postfix for = loop over array

# Combine map and grep (common pattern)
my @data   = (1..20);
my @result = map { $_ * 3 }             # step 2: multiply each by 3
             grep { $_ % 2 == 0 } @data; # step 1: keep only evens
say "Even*3: " . join(", ", @result);

# map to build a hash: each element becomes a key => value pair
my @names    = qw(Alice Bob Charlie);
my %lengths  = map { $_ => length($_) } @names;   # key = name, value = its length
foreach my $name (sort keys %lengths) {
    say "$name => $lengths{$name}";    # Alice => 5, Bob => 3, Charlie => 7
}

# map can return MULTIPLE values per element
my @pairs = map { ($_, $_ * $_) } (1..4);  # each number produces two values
say "Pairs: " . join(", ", @pairs);          # 1, 1, 2, 4, 3, 9, 4, 16
