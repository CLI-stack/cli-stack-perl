#!/usr/bin/perl
# LESSON 6: print vs say vs printf
# Three ways to output text, each with different behaviour

use strict;
use warnings;
use feature 'say';

print "Hello";      # print outputs text but does NOT add a newline at the end
print " World\n";   # \n manually adds the newline - cursor moves to next line

say "Hello World";  # say outputs text AND automatically adds newline - cleaner to use

my $name  = "Alice";   # string variable
my $score = 98.5;      # decimal number variable

printf "Name: %-10s Score: %.2f\n", $name, $score;
# printf = formatted print (like C language)
# %-10s = string, left-aligned (-), padded to 10 characters wide
# %.2f  = floating point number with exactly 2 decimal places
# \n    = newline at end

printf "Pi is approximately %.4f\n", 3.14159265;  # show pi with 4 decimal places

print STDERR "This goes to error output\n";  # STDERR = standard error stream (not stdout)

$, = ", ";              # $, is the output field separator between print arguments
print "apple", "banana", "cherry";  # prints: apple, banana, cherry
print "\n";             # print newline separately
$, = undef;             # reset separator back to nothing (default)
