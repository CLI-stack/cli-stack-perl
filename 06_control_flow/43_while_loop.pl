#!/usr/bin/perl
# LESSON 43: while Loop

use strict;
use warnings;
use feature 'say';

# Basic while loop
my $count = 1;
while ($count <= 5) {
    say "Count: $count";
    $count++;
}

# while reading lines from a string (simulated with array)
my @lines = ("line one", "line two", "line three");
while (my $line = shift @lines) {
    say "Processing: $line";
}

# Infinite loop with exit condition
say "\n--- Infinite loop demo ---";
my $x = 0;
while (1) {
    $x++;
    last if $x >= 5;   # last = break
    say "x = $x";
}
say "Exited at x = $x";

# while with multiple conditions
my $i = 0;
my $sum = 0;
while ($i < 10 && $sum < 20) {
    $sum += $i;
    $i++;
}
say "\nStopped at i=$i, sum=$sum";

# Reading a file line by line (pattern you'll use often)
# while (my $line = <FILEHANDLE>) {
#     chomp $line;
#     # process $line
# }

# While with regex
my $text = "abc123def456ghi";
my @found;
while ($text =~ /(\d+)/g) {
    push @found, $1;
}
say "Numbers found: " . join(", ", @found);
