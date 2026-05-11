#!/usr/bin/perl
# LESSON 6: print vs say vs printf

use strict;
use warnings;
use feature 'say';

# print - no automatic newline
print "Hello";
print " World\n";

# say - adds newline automatically (cleaner)
say "Hello World";

# printf - formatted output like C
my $name  = "Alice";
my $score = 98.5;

printf "Name: %-10s Score: %.2f\n", $name, $score;
# %-10s = left-aligned string, 10 chars wide
# %.2f  = float with 2 decimal places

printf "Pi is approximately %.4f\n", 3.14159265;

# print to STDERR
print STDERR "This goes to error output\n";

# Joining list items with $,
$, = ", ";    # output field separator
print "apple", "banana", "cherry";
print "\n";
$, = undef;   # reset
