#!/usr/bin/perl
# LESSON 26: Array Slices - Grab Multiple Elements at Once
# Instead of accessing one element at a time, slices get several at once

use strict;
use warnings;
use feature 'say';

my @nums = (10, 20, 30, 40, 50, 60, 70, 80);   # 8-element array (indices 0-7)

# Array slice uses @ sigil (not $) because we are getting MULTIPLE values
my @first3 = @nums[0, 1, 2];                    # get elements at index 0, 1, and 2
say "First 3: " . join(", ", @first3);           # prints: 10, 20, 30

my @middle = @nums[2..5];                        # use range .. to get a block of elements
say "Middle : " . join(", ", @middle);           # prints: 30, 40, 50, 60

my @picked = @nums[0, 3, 7];                     # non-consecutive indices
say "Picked : " . join(", ", @picked);           # prints: 10, 40, 80

# Assign to a slice to modify multiple elements simultaneously
@nums[0, 1] = (100, 200);                        # replace index 0 and 1 with new values
say "Modified: " . join(", ", @nums);            # first two elements changed

my @rev = reverse @nums[2..5];                   # reverse the order of a slice
say "Reversed slice: " . join(", ", @rev);

# Practical: extract specific fields from a record
my @record = ("Alice", 30, "Engineer", "NYC", "alice\@email.com");
# positions:    [0]   [1]    [2]        [3]       [4]

my ($name, $city) = @record[0, 3];              # grab only name and city
say "\nName: $name, City: $city";               # prints: Name: Alice, City: NYC

# Swap two elements using slice assignment
my @arr = qw(a b c d e);                        # qw() creates a list of words without quotes
@arr[1, 3] = @arr[3, 1];                        # swap values at index 1 and 3
say "After swap: " . join(", ", @arr);           # b and d are swapped
