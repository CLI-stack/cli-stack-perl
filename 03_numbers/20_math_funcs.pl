#!/usr/bin/perl
# LESSON 20: Math Functions
# Built-in and module-based math operations

use strict;
use warnings;
use feature 'say';
use POSIX qw(floor ceil);          # import floor and ceil from the POSIX module
use List::Util qw(max min sum);    # import max, min, sum from List::Util

# Built-in math functions (no module needed)
say "abs(-15)   = " . abs(-15);       # abs() = absolute value (removes negative sign) -> 15
say "int(3.9)   = " . int(3.9);       # int() = truncate decimal (NOT round) -> 3
say "int(-3.9)  = " . int(-3.9);      # truncate toward zero -> -3
say "sqrt(144)  = " . sqrt(144);      # sqrt() = square root -> 12
say "2 ** 10    = " . (2 ** 10);      # ** = exponentiation -> 1024

# POSIX module functions
say "floor(3.7) = " . floor(3.7);    # floor() = round DOWN to nearest integer -> 3
say "ceil(3.2)  = " . ceil(3.2);     # ceil()  = round UP   to nearest integer -> 4
say "floor(-3.7)= " . floor(-3.7);   # floor of negative -> -4 (further from zero)
say "ceil(-3.2) = " . ceil(-3.2);    # ceil  of negative -> -3 (closer to zero)

# Logarithm and exponential functions
say "log(1)     = " . log(1);        # log() = natural logarithm (base e) -> 0
say "log(exp(1))= " . log(exp(1));   # exp() = e raised to a power; log undoes exp -> 1
say "exp(1)     = " . exp(1);        # e (Euler's number) = approximately 2.718

# Trigonometry (angles in radians)
my $pi = 4 * atan2(1, 1);    # atan2(1,1) = 45 degrees = pi/4; multiply by 4 to get pi
say "pi = $pi";               # prints: 3.14159...
say "sin(pi/2) = " . sin($pi / 2);   # sin of 90 degrees = 1
say "cos(0)    = " . cos(0);          # cos of 0 degrees = 1

# List::Util functions - work on lists of numbers
my @nums = (5, 3, 8, 1, 9, 2);
say "max = " . max(@nums);   # max() finds the largest number -> 9
say "min = " . min(@nums);   # min() finds the smallest number -> 1
say "sum = " . sum(@nums);   # sum() adds all numbers together -> 28
