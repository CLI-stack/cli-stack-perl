#!/usr/bin/perl
# LESSON 7: chomp and chop
# Two functions that remove characters from the end of strings

use strict;
use warnings;
use feature 'say';

my $str1 = "Hello\n";   # this string has a newline character at the end
chomp $str1;             # chomp removes the trailing newline ONLY - safe to use always
say "After chomp: '$str1'";   # prints: 'Hello' - newline is gone

my $str2 = "Hello!";         # string ending with exclamation mark
my $removed = chop $str2;    # chop removes the LAST character (any character) and returns it
say "After chop : '$str2'";      # prints: 'Hello' - the ! was removed
say "Removed    : '$removed'";   # prints: '!' - chop returns what it removed

print "Type something: ";   # prompt user
my $input = <STDIN>;        # read keyboard input including the Enter key newline
chomp $input;               # remove that trailing newline from the input
say "You typed: '$input'";  # show input without newline

my $str3 = "no newline";          # string with no trailing newline
my $count = chomp $str3;          # chomp returns the number of characters it removed
say "Chomp removed $count chars"; # prints: 0 because there was nothing to remove
