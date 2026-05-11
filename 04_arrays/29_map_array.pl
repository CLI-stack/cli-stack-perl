#!/usr/bin/perl
# LESSON 29: map - Transform Arrays

use strict;
use warnings;
use feature 'say';

# map transforms each element and returns a new array
my @nums = (1..5);

# Double each number
my @doubled = map { $_ * 2 } @nums;
say "Doubled: " . join(", ", @doubled);

# Square each number
my @squared = map { $_ ** 2 } @nums;
say "Squared: " . join(", ", @squared);

# Convert strings
my @words = qw(hello world perl);
my @upper = map { uc($_) } @words;
say "Upper: " . join(", ", @upper);

# Add prefix to each
my @files = qw(file1 file2 file3);
my @paths = map { "/home/user/$_" } @files;
say "Paths:";
say "  $_" for @paths;

# Combine map and grep
my @data = (1..20);
my @result = map { $_ * 3 } grep { $_ % 2 == 0 } @data;
say "Even*3: " . join(", ", @result);

# map to create a hash (key => value pairs)
my @names = qw(Alice Bob Charlie);
my %lengths = map { $_ => length($_) } @names;
foreach my $name (sort keys %lengths) {
    say "$name => $lengths{$name}";
}

# map can return multiple values
my @pairs = map { ($_, $_ * $_) } (1..4);
say "Pairs: " . join(", ", @pairs);
