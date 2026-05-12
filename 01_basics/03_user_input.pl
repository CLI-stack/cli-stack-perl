#!/usr/bin/perl
# LESSON 3: User Input
# How to read what the user types from the keyboard

use strict;       # enforce variable declaration
use warnings;     # warn on risky code
use feature 'say'; # enable say()

print "Enter your name: ";  # print (no newline) so cursor stays on same line
my $name = <STDIN>;         # <STDIN> reads one line of input from the keyboard
chomp $name;                # chomp removes the trailing newline character that Enter adds

say "Hello, $name!";        # greet the user using their input

print "Enter your age: ";   # prompt for age input
my $age = <STDIN>;          # read the age as a string from keyboard
chomp $age;                 # remove the newline from the end

my $birth_year = 2025 - $age;       # calculate approximate birth year using arithmetic
say "You were born around $birth_year.";  # print the result
