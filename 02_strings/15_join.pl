#!/usr/bin/perl
# LESSON 15: Reverse Strings and Palindrome Check
# reverse() works on both strings and arrays

use strict;
use warnings;
use feature 'say';

my $str = "Hello Perl";     # original string
my $rev = reverse $str;     # reverse() flips the order of characters
say "Original : $str";      # prints: Hello Perl
say "Reversed : $rev";      # prints: lreP olleH

# Check if a word reads the same forwards and backwards (palindrome)
sub is_palindrome {
    my $s = lc(shift);      # shift gets the first argument; lc() lowercases it
    $s =~ s/\s+//g;         # remove all spaces so "race car" still works
    return $s eq reverse($s);  # compare string to its reverse; eq = string equal
}

my @words = ("racecar", "hello", "level", "Perl", "madam");  # test words
foreach my $word (@words) {           # loop through each word
    if (is_palindrome($word)) {
        say "'$word' IS a palindrome";    # same forwards and backwards
    } else {
        say "'$word' is NOT a palindrome";
    }
}

# Use x (repetition) to build visual layouts
say "-" x 40;                            # print 40 dashes
say "| " . " " x 36 . " |";             # padded box sides
say "| " . "  PERL LESSONS  " x 2 . " |";  # repeated text inside box
say "-" x 40;                            # close the box

my $pattern = "AB" x 5;   # repeat "AB" 5 times
say $pattern;              # prints: ABABABABAB
