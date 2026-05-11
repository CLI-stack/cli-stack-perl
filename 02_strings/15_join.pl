#!/usr/bin/perl
# LESSON 15: Reverse and Repeat Strings

use strict;
use warnings;
use feature 'say';

# reverse a string
my $str = "Hello Perl";
my $rev = reverse $str;
say "Original : $str";
say "Reversed : $rev";

# Check if palindrome
sub is_palindrome {
    my $s = lc(shift);
    $s =~ s/\s+//g;        # remove spaces
    return $s eq reverse($s);
}

my @words = ("racecar", "hello", "level", "Perl", "madam");
foreach my $word (@words) {
    if (is_palindrome($word)) {
        say "'$word' IS a palindrome";
    } else {
        say "'$word' is NOT a palindrome";
    }
}

# Repeat a string with x
say "-" x 40;
say "| " . " " x 36 . " |";
say "| " . "  PERL LESSONS  " x 2 . " |";
say "-" x 40;

# Repeat to build a pattern
my $pattern = "AB" x 5;
say $pattern;   # ABABABABAB
