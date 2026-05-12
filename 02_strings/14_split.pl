#!/usr/bin/perl
# LESSON 14: join() - Combine an Array Back into a String
# join is the reverse of split - it glues array elements together

use strict;
use warnings;
use feature 'say';

my @fruits = ("apple", "banana", "cherry", "date");   # an array of strings

# join(separator, array) - puts separator between each element
say join(", ",  @fruits);    # prints: apple, banana, cherry, date
say join(" | ", @fruits);    # prints: apple | banana | cherry | date
say join("",    @fruits);    # prints: applebananacherrydate  (no separator)
say join("\n",  @fruits);    # prints each fruit on its own line

# Round-trip: split then join - useful for transformation
my $str    = "one-two-three-four";    # original hyphen-separated string
my @parts  = split(/-/, $str);        # split on hyphen
my $joined = join(" + ", @parts);     # join with " + " instead
say $joined;   # prints: one + two + three + four

# Build a sentence from separate words
my @words = ("Perl", "is", "awesome");
say join(" ", @words) . "!";    # prints: Perl is awesome!

# Join a range of numbers
my @nums = (1..5);               # (1..5) creates list: 1, 2, 3, 4, 5
say join(", ", @nums);           # prints: 1, 2, 3, 4, 5

# Build a CSV line from fields
my @fields   = ("Alice", 30, "Engineer", "New York");  # mixed types are fine
my $csv_line = join(",", @fields);   # join with comma (no spaces = CSV format)
say "CSV: $csv_line";                # prints: CSV: Alice,30,Engineer,New York
