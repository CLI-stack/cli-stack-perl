#!/usr/bin/perl
# LESSON 28: grep - Filter Arrays
# grep tests each element and keeps only the ones where the condition is true

use strict;
use warnings;
use feature 'say';

# grep { condition } @array - returns elements where condition is TRUE
# Inside the block, $_ holds the current element being tested
my @nums = (1..20);   # array: 1, 2, 3, ... 20

my @evens = grep { $_ % 2 == 0 } @nums;   # keep only numbers where remainder of /2 is 0
say "Evens: " . join(", ", @evens);         # 2, 4, 6, 8...

my @odds = grep { $_ % 2 != 0 } @nums;    # keep only numbers where remainder is NOT 0
say "Odds : " . join(", ", @odds);

# grep on strings
my @words = qw(apple Banana cherry Apple CHERRY date);   # mixed case words
my @lower_only = grep { $_ eq lc($_) } @words;           # keep only fully lowercase words
say "All lowercase: " . join(", ", @lower_only);          # apple, cherry, date

# grep with a regex pattern
my @fruits  = qw(apple apricot banana avocado blueberry cherry);
my @a_words = grep { /^a/i } @fruits;   # /^a/i matches words starting with 'a' (case-insensitive)
say "Start with 'a': " . join(", ", @a_words);

# grep in SCALAR context returns a COUNT instead of a list
my $count = grep { /^a/i } @fruits;    # how many elements match?
say "Count starting 'a': $count";       # prints the number

# Multiple conditions in grep
my @big_evens = grep { $_ > 10 && $_ % 2 == 0 } @nums;  # must satisfy BOTH conditions
say "Even > 10: " . join(", ", @big_evens);

# grep to filter out undef values from a mixed array
my @mixed   = (1, undef, 3, undef, 5);
my @defined = grep { defined } @mixed;   # 'defined' tests $_ by default
say "Defined: " . join(", ", @defined);   # 1, 3, 5
