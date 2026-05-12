#!/usr/bin/perl
# LESSON 17: Formatted Output with sprintf
# sprintf builds a formatted string without printing it

use strict;
use warnings;
use feature 'say';

my $name  = "Alice";    # student name
my $score = 97.567;     # raw score with many decimal places
my $rank  = 1;          # rank number

# sprintf returns a formatted string - useful for building output before printing
my $report = sprintf "%-10s | Rank: %3d | Score: %6.2f%%", $name, $rank, $score;
# %-10s   = left-aligned string in 10-char field
# %3d     = integer in 3-char field (right-aligned)
# %6.2f   = float with 6 total width and 2 decimal places
# %%      = literal percent sign (% escapes as %%)
say $report;

# Build a formatted table using printf
my @students = (
    ["Alice",   97.5, 1],   # each inner array = one row of data
    ["Bob",     85.0, 2],
    ["Charlie", 76.3, 3],
);

say "-" x 40;
printf "%-12s %6s %6s\n", "Name", "Score", "Rank";   # header row
say "-" x 40;
foreach my $row (@students) {                          # loop through each student
    printf "%-12s %6.1f %6d\n", $row->[0], $row->[1], $row->[2];
    # $row->[0] = name, $row->[1] = score (1 decimal), $row->[2] = rank (integer)
}
say "-" x 40;

# Different number format specifiers
my $big = 1234567.89;
printf "Default    : %f\n",   $big;    # %f = float with 6 decimal places by default
printf "2 decimals : %.2f\n", $big;    # %.2f = exactly 2 decimal places
printf "Scientific : %e\n",   $big;    # %e = scientific notation
printf "Integer    : %d\n",   $big;    # %d = integer (truncates decimal)
printf "String     : %s\n",   "hello"; # %s = string
printf "Padded     : %10s\n", "hello"; # %10s = right-align string in 10 chars
