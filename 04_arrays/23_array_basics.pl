#!/usr/bin/perl
# LESSON 23: Array Basics

use strict;
use warnings;
use feature 'say';

# Arrays store ordered lists of scalars
my @fruits = ("apple", "banana", "cherry");
my @nums   = (1, 2, 3, 4, 5);
my @mixed  = ("hello", 42, 3.14, "world");

# Access by index (0-based)
say $fruits[0];   # apple
say $fruits[1];   # banana
say $fruits[2];   # cherry
say $fruits[-1];  # cherry (last element)
say $fruits[-2];  # banana (second to last)

# Array size
say "Number of fruits: " . scalar(@fruits);
say "Last index      : $#fruits";   # index of last element

# Print all elements
say "\nAll fruits:";
foreach my $fruit (@fruits) {
    say "  $fruit";
}

# Range operator ..
my @ten = (1..10);
say "\n1 to 10: " . join(", ", @ten);

my @letters = ('a'..'z');
say "Alphabet: " . join("", @letters);

# Array in boolean context = true if non-empty
if (@fruits) {
    say "\nArray is not empty";
}

# Empty array
my @empty = ();
say "Empty: " . scalar(@empty);   # 0
