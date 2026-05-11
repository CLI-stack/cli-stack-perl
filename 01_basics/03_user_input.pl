#!/usr/bin/perl
# LESSON 3: User Input
# Read input from keyboard using <STDIN>

use strict;
use warnings;
use feature 'say';

print "Enter your name: ";
my $name = <STDIN>;       # reads a line from keyboard
chomp $name;              # removes the trailing newline

say "Hello, $name!";

print "Enter your age: ";
my $age = <STDIN>;
chomp $age;

my $birth_year = 2025 - $age;
say "You were born around $birth_year.";
