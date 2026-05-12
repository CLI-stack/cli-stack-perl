#!/usr/bin/perl
# LESSON 23: Array Basics
# Arrays store an ORDERED list of values - like a numbered list

use strict;
use warnings;
use feature 'say';

# Arrays use @ sigil; elements are enclosed in parentheses
my @fruits = ("apple", "banana", "cherry");   # array of 3 strings
my @nums   = (1, 2, 3, 4, 5);                # array of 5 numbers
my @mixed  = ("hello", 42, 3.14, "world");   # arrays can hold mixed types

# Access individual elements with $array[index] - index starts at 0
say $fruits[0];   # first element  -> apple
say $fruits[1];   # second element -> banana
say $fruits[2];   # third element  -> cherry
say $fruits[-1];  # -1 = last element (count from end) -> cherry
say $fruits[-2];  # -2 = second to last -> banana

# Array size and last index
say "Number of fruits: " . scalar(@fruits);  # scalar() in numeric context = count -> 3
say "Last index      : $#fruits";            # $#arrayname = index of last element -> 2

# Iterate through all elements with foreach
say "\nAll fruits:";
foreach my $fruit (@fruits) {   # $fruit takes each value in turn
    say "  $fruit";              # print each element
}

# Range operator .. creates a list of consecutive values
my @ten     = (1..10);          # creates: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
my @letters = ('a'..'z');       # works with letters too
say "\n1 to 10: " . join(", ", @ten);
say "Alphabet: " . join("", @letters);   # no separator = all stuck together

# Array in boolean context: true if non-empty, false if empty
if (@fruits) {
    say "\nArray is not empty";   # runs because @fruits has elements
}

my @empty = ();                        # create an empty array
say "Empty array count: " . scalar(@empty);  # prints: 0
