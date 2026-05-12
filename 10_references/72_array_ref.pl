#!/usr/bin/perl
# LESSON 72: Array References
# Arrays can be referenced so they can be stored inside other data structures

use strict;
use warnings;
use feature 'say';

my @fruits = ("apple", "banana", "cherry");   # regular named array

# Create a reference to an array using backslash
my $aref = \@fruits;   # $aref holds the address of @fruits

say "Type: " . ref($aref);   # prints: ARRAY

# Dereference back to an array using @{$aref} or @$aref
say "All: " . join(", ", @{$aref});   # @{ } dereferences: gives back the full array

# Access individual elements using arrow notation $aref->[index]
say "First  : " . $aref->[0];    # apple  - most common way
say "Second : " . $aref->[1];    # banana
say "Last   : " . $aref->[-1];   # cherry (-1 = last)

# ANONYMOUS array reference - created with [...] - no named @array needed
# This is the most common way to use array refs in real code
my $colors = ["red", "green", "blue"];   # [...] creates an array ref directly
say "\nColors: " . join(", ", @$colors);  # @$colors = dereference
say "Second color: $colors->[1]";         # green

# Modifying via reference changes the original
push @{$aref}, "date";            # push to the referenced array
say "\nAfter push: " . join(", ", @fruits);   # @fruits now has 4 elements

$aref->[0] = "APPLE";             # change first element through the reference
say "Modified: $fruits[0]";        # @fruits[0] is now "APPLE"

# MATRIX: array of array references (2D structure)
my @matrix = (
    [1, 2, 3],   # each element is an anonymous array ref
    [4, 5, 6],
    [7, 8, 9],
);

say "\nMatrix:";
for my $row (@matrix) {            # $row is each array ref
    say join("\t", @$row);         # @$row dereferences to get the inner array
}
say "Center: $matrix[1][1]";       # 5 - shorthand: [row][col]
say "Center: $matrix[1]->[1]";     # 5 - explicit arrow (same result)

# Array of array refs is very common for tables/spreadsheets
my @students = (
    ["Alice", 95],
    ["Bob",   80],
);
say "\n$_->[0] => $_->[1]" for @students;   # print name and score for each
