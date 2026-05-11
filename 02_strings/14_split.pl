#!/usr/bin/perl
# LESSON 14: join() - Combine Array into String

use strict;
use warnings;
use feature 'say';

my @fruits = ("apple", "banana", "cherry", "date");

# join(separator, list)
say join(", ",  @fruits);    # apple, banana, cherry, date
say join(" | ", @fruits);    # apple | banana | cherry | date
say join("",    @fruits);    # applebananacherrydate
say join("\n",  @fruits);    # each on its own line

# Round-trip: split then join
my $str    = "one-two-three-four";
my @parts  = split(/-/, $str);
my $joined = join(" + ", @parts);
say $joined;   # one + two + three + four

# Build a sentence
my @words = ("Perl", "is", "awesome");
say join(" ", @words) . "!";

# Join numbers
my @nums = (1..5);
say join(", ", @nums);   # 1, 2, 3, 4, 5

# Practical: create a CSV line
my @fields = ("Alice", 30, "Engineer", "New York");
my $csv_line = join(",", @fields);
say "CSV: $csv_line";
