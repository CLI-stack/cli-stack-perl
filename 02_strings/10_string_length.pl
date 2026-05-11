#!/usr/bin/perl
# LESSON 10: String Length and Position

use strict;
use warnings;
use feature 'say';

my $str = "Perl Programming";

say "String  : $str";
say "Length  : " . length($str);

# index() - find first occurrence of substring (returns -1 if not found)
my $pos = index($str, "Pro");
say "index of 'Pro': $pos";   # 5

# index with start position
my $str2 = "banana";
say index($str2, "a");      # 1 (first 'a')
say index($str2, "a", 2);   # 3 (search from pos 2)

# rindex() - find LAST occurrence
say rindex($str2, "a");     # 5 (last 'a')

# Check if substring exists
if (index($str, "Perl") != -1) {
    say "Found 'Perl' in string!";
}

# index returns 0-based position
my $sentence = "The cat sat on the mat";
my $i = 0;
while (($i = index($sentence, "at", $i)) != -1) {
    say "Found 'at' at position $i";
    $i++;
}
