#!/usr/bin/perl
# LESSON 30: splice - Insert, Remove, or Replace Elements Anywhere
# splice is the most powerful array modification tool

use strict;
use warnings;
use feature 'say';

# splice(array, offset, length, replacement_list)
# offset  = where to start (position in array)
# length  = how many elements to remove
# list    = what to insert in their place (optional)

my @arr = (1, 2, 3, 4, 5, 6, 7);

# Remove 2 elements starting at index 2
my @removed = splice(@arr, 2, 2);           # removes elements at index 2 and 3
say "Removed : " . join(", ", @removed);    # prints: 3, 4 (what was removed)
say "Array   : " . join(", ", @arr);        # prints: 1, 2, 5, 6, 7

# Insert elements without removing any (length = 0)
@arr = (1, 2, 3, 4, 5);
splice(@arr, 2, 0, 10, 20);                 # at index 2, remove 0, insert 10 and 20
say "After insert: " . join(", ", @arr);    # prints: 1, 2, 10, 20, 3, 4, 5

# Replace an element with new values (remove 1, insert 2)
@arr = qw(a b c d e);
splice(@arr, 1, 1, "X", "Y");              # at index 1, remove 1 element, insert X and Y
say "After replace: " . join(", ", @arr);  # prints: a, X, Y, c, d, e

# Negative offset counts from the END of the array
@arr = (1..8);
my @last2 = splice(@arr, -2);              # -2 = start from 2nd-to-last; no length = remove to end
say "Last 2   : " . join(", ", @last2);   # prints: 7, 8
say "Remaining: " . join(", ", @arr);     # prints: 1, 2, 3, 4, 5, 6

# Delete a single element (remove 1, insert nothing)
@arr = qw(cat dog bird fish);
splice(@arr, 1, 1);                        # remove 1 element at index 1 ("dog")
say "After delete: " . join(", ", @arr);  # prints: cat, bird, fish

# Insert a value into a sorted array at the correct position
my @sorted  = (1, 3, 5, 7, 9);
my $new_val = 4;
my $pos     = 0;
$pos++ while $pos < @sorted && $sorted[$pos] < $new_val;  # find insertion position
splice(@sorted, $pos, 0, $new_val);        # insert at the found position
say "Inserted $new_val: " . join(", ", @sorted);   # 1, 3, 4, 5, 7, 9
