#!/usr/bin/perl
# LESSON 43: while Loop
# Repeat code as long as a condition remains true

use strict;
use warnings;
use feature 'say';

# Basic while loop - checks condition BEFORE each iteration
my $count = 1;
while ($count <= 5) {     # condition checked at the top
    say "Count: $count";   # runs while count is 1, 2, 3, 4, 5
    $count++;              # MUST update the variable or you get an infinite loop!
}

# Process elements from an array using shift inside while
my @lines = ("line one", "line two", "line three");
while (my $line = shift @lines) {    # shift removes and returns front element
    say "Processing: $line";          # runs until @lines is empty (shift returns undef = false)
}

# Infinite loop with last to exit (common pattern)
say "\n--- Controlled infinite loop ---";
my $x = 0;
while (1) {              # 1 is always true - loop runs forever...
    $x++;
    last if $x >= 5;    # ...until 'last' exits the loop (like 'break' in other languages)
    say "x = $x";       # prints 1, 2, 3, 4
}
say "Exited at x = $x";  # prints: 5

# Multiple conditions in one while
my $i   = 0;
my $sum = 0;
while ($i < 10 && $sum < 20) {   # stop when EITHER condition fails
    $sum += $i;                   # add current $i to running total
    $i++;
}
say "\nStopped at i=$i, sum=$sum";   # shows which condition triggered the stop

# while with regex (find all matches in a string one at a time)
my $text   = "abc123def456ghi";
my @found;
while ($text =~ /(\d+)/g) {    # /g makes it continue from where it left off each iteration
    push @found, $1;            # $1 = the captured group from the last match
}
say "Numbers found: " . join(", ", @found);   # 123, 456
