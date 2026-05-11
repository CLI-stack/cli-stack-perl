#!/usr/bin/perl
# LESSON 7: chomp and chop

use strict;
use warnings;
use feature 'say';

# chomp - removes trailing newline (safe, most common)
my $str1 = "Hello\n";
chomp $str1;
say "After chomp: '$str1'";   # 'Hello'

# chop - removes last character (any character)
my $str2 = "Hello!";
my $removed = chop $str2;
say "After chop : '$str2'";       # 'Hello'
say "Removed    : '$removed'";    # '!'

# chomp on user input
print "Type something: ";
my $input = <STDIN>;
chomp $input;
say "You typed: '$input'";

# chomp returns number of chars removed (usually 1 or 0)
my $str3 = "no newline";
my $count = chomp $str3;
say "Chomp removed $count chars from '$str3'";
