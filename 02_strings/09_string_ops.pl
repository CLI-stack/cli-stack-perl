#!/usr/bin/perl
# LESSON 9: Basic String Operations

use strict;
use warnings;
use feature 'say';

my $str = "Hello, Perl!";

# Length
say "Length: " . length($str);

# Concatenation
my $greeting = "Good " . "morning!";
say $greeting;

# Repetition
say "Ha" x 5;   # HaHaHaHaHa

# String comparison operators (use eq, ne, lt, gt, le, ge)
my $a = "apple";
my $b = "banana";

if ($a eq $b) { say "equal"       }
if ($a ne $b) { say "not equal"   }
if ($a lt $b) { say "a < b alpha" }
if ($b gt $a) { say "b > a alpha" }

# Numeric comparison: == != < > <= >=
my $x = 10;
my $y = 20;
say "x < y" if $x < $y;

# Common mistake: using == for strings
say "same" if "hello" eq "hello";   # correct
# say "same" if "hello" == "hello"; # WRONG - numeric compare
