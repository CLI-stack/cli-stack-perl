#!/usr/bin/perl
# LESSON 17: String Formatting with sprintf

use strict;
use warnings;
use feature 'say';

# sprintf returns a formatted string (doesn't print)
my $name  = "Alice";
my $score = 97.567;
my $rank  = 1;

my $report = sprintf "%-10s | Rank: %3d | Score: %6.2f%%", $name, $rank, $score;
say $report;

# Format a table
my @students = (
    ["Alice",   97.5, 1],
    ["Bob",     85.0, 2],
    ["Charlie", 76.3, 3],
);

say "-" x 40;
printf "%-12s %6s %6s\n", "Name", "Score", "Rank";
say "-" x 40;
foreach my $row (@students) {
    printf "%-12s %6.1f %6d\n", $row->[0], $row->[1], $row->[2];
}
say "-" x 40;

# Number formatting
my $big = 1234567.89;
printf "Default    : %f\n",   $big;
printf "2 decimals : %.2f\n", $big;
printf "Scientific : %e\n",   $big;
printf "Integer    : %d\n",   $big;

# String in different formats
printf "String : %s\n",  "hello";
printf "Padded : %10s\n","hello";
