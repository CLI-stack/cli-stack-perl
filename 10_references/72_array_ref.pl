#!/usr/bin/perl
# LESSON 72: Array References

use strict;
use warnings;
use feature 'say';

my @fruits = ("apple", "banana", "cherry");

# Create reference to array
my $aref = \@fruits;

say "Type: " . ref($aref);   # ARRAY

# Dereference: @{$aref} or @$aref
say "All: " . join(", ", @{$aref});

# Access element: $aref->[index] or $$aref[index]
say "First: " . $aref->[0];
say "Last : " . $aref->[-1];

# Anonymous array reference (no named variable) - very common!
my $colors = ["red", "green", "blue"];
say "\nColors: " . join(", ", @$colors);
say "Second: $colors->[1]";

# Modify via reference
push @{$aref}, "date";
say "\nAfter push: " . join(", ", @fruits);

$aref->[0] = "APPLE";
say "Modified: $fruits[0]";

# Array ref is what you use inside complex structures
my @matrix = (
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
);

say "\nMatrix:";
for my $row (@matrix) {
    say join("\t", @$row);
}
say "Center: $matrix[1][1]";    # 5
say "Center: $matrix[1]->[1]";  # 5 (arrow is optional after first)

# Array of array refs
my @students = (
    ["Alice", 95],
    ["Bob",   80],
);
say "\n$_->[0] => $_->[1]" for @students;
