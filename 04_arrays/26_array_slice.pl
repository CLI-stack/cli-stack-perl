#!/usr/bin/perl
# LESSON 26: Array Slices - Get Multiple Elements

use strict;
use warnings;
use feature 'say';

my @nums = (10, 20, 30, 40, 50, 60, 70, 80);

# Array slice - get multiple elements at once using @
my @first3 = @nums[0, 1, 2];
say "First 3: " . join(", ", @first3);

# Using a range
my @middle = @nums[2..5];
say "Middle : " . join(", ", @middle);

# Non-consecutive indices
my @picked = @nums[0, 3, 7];
say "Picked : " . join(", ", @picked);

# Assign to slice (modify multiple elements)
@nums[0, 1] = (100, 200);
say "Modified: " . join(", ", @nums);

# Reverse a slice
my @rev = reverse @nums[2..5];
say "Reversed slice: " . join(", ", @rev);

# Practical: extract columns from data
my @record = ("Alice", 30, "Engineer", "NYC", "alice@email.com");
# field positions: 0=name, 1=age, 2=job, 3=city, 4=email
my ($name, $city) = @record[0, 3];
say "\nName: $name, City: $city";

# Swap two elements using slice
my @arr = qw(a b c d e);
@arr[1, 3] = @arr[3, 1];   # swap index 1 and 3
say "After swap: " . join(", ", @arr);
