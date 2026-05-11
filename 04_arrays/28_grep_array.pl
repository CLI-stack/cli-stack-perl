#!/usr/bin/perl
# LESSON 28: grep - Filter Arrays

use strict;
use warnings;
use feature 'say';

# grep(condition, list) - returns elements where condition is true
my @nums = (1..20);

# Filter even numbers
my @evens = grep { $_ % 2 == 0 } @nums;
say "Evens: " . join(", ", @evens);

# Filter odd numbers
my @odds = grep { $_ % 2 != 0 } @nums;
say "Odds : " . join(", ", @odds);

# Filter strings
my @words = qw(apple Banana cherry Apple CHERRY date);
my @lower_only = grep { $_ eq lc($_) } @words;
say "All lowercase: " . join(", ", @lower_only);

# Filter using regex
my @fruits = qw(apple apricot banana avocado blueberry cherry);
my @a_words = grep { /^a/i } @fruits;
say "Start with 'a': " . join(", ", @a_words);

# Count matches (grep in scalar context)
my $count = grep { /^a/i } @fruits;
say "Count starting 'a': $count";

# grep with multiple conditions
my @big_evens = grep { $_ > 10 && $_ % 2 == 0 } @nums;
say "Even > 10: " . join(", ", @big_evens);

# Filter defined values
my @mixed = (1, undef, 3, undef, 5);
my @defined = grep { defined } @mixed;
say "Defined: " . join(", ", @defined);
