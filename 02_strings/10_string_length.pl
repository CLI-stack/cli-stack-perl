#!/usr/bin/perl
# LESSON 10: String Length and Finding Substrings
# How to find where a smaller string exists inside a larger string

use strict;
use warnings;
use feature 'say';

my $str = "Perl Programming";   # the string we will search inside

say "String  : $str";
say "Length  : " . length($str);   # length() returns number of characters (16)

# index(string, substring) - find the FIRST position of substring
# Returns -1 if not found; positions start at 0
my $pos = index($str, "Pro");   # search for "Pro" inside $str
say "index of 'Pro': $pos";     # prints: 5 (position 5 counting from 0)

my $str2 = "banana";                  # string with repeated letters
say index($str2, "a");                # prints: 1 (first 'a' is at position 1)
say index($str2, "a", 2);            # prints: 3 (search starting FROM position 2)
                                      # the third argument is where to START searching

# rindex(string, substring) - find the LAST occurrence
say rindex($str2, "a");   # prints: 5 (last 'a' is at position 5)

if (index($str, "Perl") != -1) {   # -1 means not found; anything else means found
    say "Found 'Perl' in string!";  # this runs because "Perl" IS in $str
}

# Loop through ALL occurrences of a substring
my $sentence = "The cat sat on the mat";
my $i = 0;                                  # start searching from position 0
while (($i = index($sentence, "at", $i)) != -1) {  # keep searching forward
    say "Found 'at' at position $i";        # print each match position
    $i++;                                   # move forward so we don't match same spot again
}
