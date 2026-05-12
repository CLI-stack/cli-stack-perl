#!/usr/bin/perl
# LESSON 9: Basic String Operations
# The most common things you do with strings

use strict;
use warnings;
use feature 'say';

my $str = "Hello, Perl!";   # a simple string stored in a scalar

say "Length: " . length($str);  # length() counts the number of characters in the string

my $greeting = "Good " . "morning!";  # . joins two strings into one
say $greeting;                          # prints: Good morning!

say "Ha" x 5;   # x repeats the string - prints: HaHaHaHaHa

# String comparison operators - ALWAYS use these for comparing strings (not == or !=)
my $a = "apple";    # first string to compare
my $b = "banana";   # second string to compare

if ($a eq $b) { say "equal"       }  # eq = equal (string comparison)
if ($a ne $b) { say "not equal"   }  # ne = not equal
if ($a lt $b) { say "a < b alpha" }  # lt = less than (alphabetical order)
if ($b gt $a) { say "b > a alpha" }  # gt = greater than

# Numeric comparison operators - use ONLY for numbers
my $x = 10;   # number variable
my $y = 20;   # number variable
say "x < y" if $x < $y;   # < compares numerically (10 is less than 20)

# Common beginner mistake
say "same" if "hello" eq "hello";    # CORRECT - use eq for strings
# say "same" if "hello" == "hello";  # WRONG  - == is for numbers only
