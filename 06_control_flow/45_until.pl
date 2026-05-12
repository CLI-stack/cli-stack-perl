#!/usr/bin/perl
# LESSON 45: Loop Controls - last, next, and Labeled Loops
# Control WHERE the loop goes next: exit it, skip to next round, or jump out of nested loops

use strict;
use warnings;
use feature 'say';

# last - immediately EXIT the current loop (like 'break' in Python/Java/C)
say "--- last (stops loop) ---";
for my $i (1..10) {
    last if $i > 5;   # when $i exceeds 5, exit loop immediately
    say $i;           # prints 1, 2, 3, 4, 5 - then loop stops
}

# next - skip the rest of this iteration and go to the NEXT one (like 'continue')
say "\n--- next (skips even numbers) ---";
for my $i (1..10) {
    next if $i % 2 == 0;   # if $i is even, skip to next iteration
    say $i;                 # only prints odd numbers: 1, 3, 5, 7, 9
}

# Labeled loops: put a LABEL on outer loops so you can target them from inner loops
# Label names are ALL_CAPS by convention
say "\n--- labeled last (exit outer loop from inner) ---";
OUTER: for my $i (1..4) {              # OUTER: is the label for this loop
    for my $j (1..4) {
        if ($i + $j == 6) {
            say "Found: $i + $j = 6 -- stopping outer loop";
            last OUTER;                # exits the OUTER loop, not just the inner one
        }
        say "  i=$i j=$j sum=" . ($i + $j);
    }
}

# Labeled next: skip to next iteration of the OUTER loop from inside the inner loop
say "\n--- labeled next (skip outer when j==2) ---";
OUTER2: for my $i (1..3) {
    for my $j (1..3) {
        next OUTER2 if $j == 2;   # when j is 2, skip to next $i iteration entirely
        say "i=$i j=$j";           # only prints pairs where j is 1
    }
}
