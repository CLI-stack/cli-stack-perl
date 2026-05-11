#!/usr/bin/perl
# LESSON 41: for and C-style for Loop

use strict;
use warnings;
use feature 'say';

# C-style for loop: for (init; condition; update)
say "--- Counting up ---";
for (my $i = 0; $i < 5; $i++) {
    say "i = $i";
}

say "\n--- Counting down ---";
for (my $i = 10; $i >= 0; $i -= 2) {
    say "i = $i";
}

# Loop with range
say "\n--- Squares ---";
for my $n (1..10) {
    printf "  %2d squared = %3d\n", $n, $n ** 2;
}

# Nested loops - multiplication table
say "\n--- Multiplication Table ---";
for my $i (1..5) {
    for my $j (1..5) {
        printf "%4d", $i * $j;
    }
    print "\n";
}

# Loop variable is $_ by default if not named
say "\n--- Default \$_ ---";
for (1..5) {
    say "Value: $_";
}

# Iterate over array with index
my @fruits = qw(apple banana cherry);
say "\n--- Array with index ---";
for my $i (0..$#fruits) {
    say "[$i] $fruits[$i]";
}
