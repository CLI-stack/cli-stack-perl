#!/usr/bin/perl
# LESSON 2: Variables
# Perl has 3 variable types: scalar ($), array (@), hash (%)

use strict;       # enforce variable declaration
use warnings;     # warn on risky code
use feature 'say'; # enable say()

my $name   = "Alice";  # my = declare a new variable; $ = scalar (single value); holds a string
my $age    = 25;       # scalar holding a number (integer)
my $height = 5.6;      # scalar holding a decimal number (float)
my $active = 1;        # 1 means true in Perl; 0 means false

say "Name   : $name";    # variables inside double quotes are automatically expanded (interpolated)
say "Age    : $age";     # prints the VALUE of $age, not the word "$age"
say "Height : $height";  # prints 5.6
say "Active : $active";  # prints 1

my $number = 42;                      # assign an integer to $number
my $string = "The answer is $number"; # embed $number inside the string - Perl replaces it with 42
say $string;                          # prints: The answer is 42

$name = "Bob";        # you can reassign a variable any time
say "Name is now: $name";  # prints: Name is now: Bob
