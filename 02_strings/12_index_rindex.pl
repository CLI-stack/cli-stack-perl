#!/usr/bin/perl
# LESSON 12: substr() - Extract and Replace Parts of Strings

use strict;
use warnings;
use feature 'say';

my $str = "Hello, Perl World!";

# substr(string, start, length)
say substr($str, 0, 5);    # Hello   (pos 0, 5 chars)
say substr($str, 7, 4);    # Perl    (pos 7, 4 chars)
say substr($str, -6);      # orld!   (from end)

# Extract last N characters
say substr($str, -6, 5);   # World

# Replace using substr as lvalue
my $s = "Hello World";
substr($s, 6, 5) = "Perl";
say $s;   # Hello Perl

# substr with 4 args: (string, offset, length, replacement)
my $s2 = "I like cats";
my $old = substr($s2, 7, 4, "dogs");
say "New: $s2";    # I like dogs
say "Old: $old";   # cats

# Get everything from position N onwards
my $path = "/home/user/documents/file.txt";
my $filename = substr($path, rindex($path, "/") + 1);
say "Filename: $filename";
