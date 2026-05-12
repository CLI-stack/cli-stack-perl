#!/usr/bin/perl
# LESSON 41: for Loop
# Two styles: C-style (init; condition; update) and range-based foreach

use strict;
use warnings;
use feature 'say';

# C-style for loop: three parts separated by semicolons
# for (initialise; test_condition; update_after_each_iteration)
say "--- Counting up ---";
for (my $i = 0; $i < 5; $i++) {   # start at 0, run while i<5, add 1 each time
    say "i = $i";                   # prints 0, 1, 2, 3, 4
}

say "\n--- Counting down by 2 ---";
for (my $i = 10; $i >= 0; $i -= 2) {   # start at 10, count down by 2 each time
    say "i = $i";                        # prints 10, 8, 6, 4, 2, 0
}

# Range-based for: iterate over a list - cleaner when you have a fixed range
say "\n--- Squares ---";
for my $n (1..10) {                           # (1..10) creates list 1,2,3..10
    printf "  %2d squared = %3d\n", $n, $n ** 2;  # %2d = 2-digit int, %3d = 3-digit int
}

# Nested loops - one loop inside another
say "\n--- Multiplication Table ---";
for my $i (1..5) {              # outer loop: rows
    for my $j (1..5) {          # inner loop: columns
        printf "%4d", $i * $j;  # %4d = right-aligned in 4 chars
    }
    print "\n";                 # newline after each row
}

# Default loop variable $_ (when no variable name given)
say "\n--- Default \$_ ---";
for (1..5) {           # no 'my $var' - uses $_ automatically
    say "Value: $_";   # $_ holds the current value
}

# Iterate over array WITH index (when you need position numbers)
my @fruits = qw(apple banana cherry);
say "\n--- Array with index ---";
for my $i (0..$#fruits) {          # 0..$#fruits = range from 0 to last index
    say "[$i] $fruits[$i]";         # show index and corresponding element
}
