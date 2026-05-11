#!/usr/bin/perl
# LESSON 30: splice - Insert, Remove, Replace in Array

use strict;
use warnings;
use feature 'say';

# splice(array, offset, length, list)
my @arr = (1, 2, 3, 4, 5, 6, 7);

# Remove 2 elements starting at index 2
my @removed = splice(@arr, 2, 2);
say "Removed : " . join(", ", @removed);   # 3, 4
say "Array   : " . join(", ", @arr);       # 1, 2, 5, 6, 7

# Insert elements at position 2 (remove 0)
@arr = (1, 2, 3, 4, 5);
splice(@arr, 2, 0, 10, 20);
say "After insert: " . join(", ", @arr);   # 1, 2, 10, 20, 3, 4, 5

# Replace element at index 1 with new values
@arr = qw(a b c d e);
splice(@arr, 1, 1, "X", "Y");
say "After replace: " . join(", ", @arr);  # a, X, Y, c, d, e

# Remove from end using negative offset
@arr = (1..8);
my @last2 = splice(@arr, -2);
say "Last 2   : " . join(", ", @last2);    # 7, 8
say "Remaining: " . join(", ", @arr);      # 1, 2, 3, 4, 5, 6

# Delete single element
@arr = qw(cat dog bird fish);
splice(@arr, 1, 1);   # remove "dog"
say "After delete: " . join(", ", @arr);   # cat, bird, fish

# Practical: insert sorted
my @sorted = (1, 3, 5, 7, 9);
my $new_val = 4;
my $pos = 0;
$pos++ while $pos < @sorted && $sorted[$pos] < $new_val;
splice(@sorted, $pos, 0, $new_val);
say "Inserted $new_val: " . join(", ", @sorted);
