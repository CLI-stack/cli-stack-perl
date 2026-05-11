#!/usr/bin/perl
# LESSON 45: Loop Controls - last, next, redo

use strict;
use warnings;
use feature 'say';

# last - exits the loop immediately (like 'break' in C/Python)
say "--- last ---";
for my $i (1..10) {
    last if $i > 5;
    say $i;
}

# next - skip to next iteration (like 'continue' in C/Python)
say "\n--- next (skip evens) ---";
for my $i (1..10) {
    next if $i % 2 == 0;
    say $i;
}

# Labeled loops - break out of nested loops
say "\n--- labeled last ---";
OUTER: for my $i (1..4) {
    for my $j (1..4) {
        if ($i + $j == 6) {
            say "Found: $i + $j = 6 -- stopping outer";
            last OUTER;   # exits the OUTER loop
        }
        say "  i=$i j=$j sum=" . ($i + $j);
    }
}

# next with label - skip to next outer iteration
say "\n--- labeled next ---";
OUTER2: for my $i (1..3) {
    for my $j (1..3) {
        next OUTER2 if $j == 2;
        say "i=$i j=$j";
    }
}

# redo - restart current iteration (rare, use carefully)
# redo does not re-check the condition or advance the iterator
