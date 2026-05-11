#!/usr/bin/perl
# LESSON 20: Math Functions

use strict;
use warnings;
use feature 'say';
use POSIX qw(floor ceil);

# Built-in math functions
say "abs(-15)   = " . abs(-15);       # 15
say "int(3.9)   = " . int(3.9);       # 3  (truncate)
say "int(-3.9)  = " . int(-3.9);      # -3
say "sqrt(144)  = " . sqrt(144);      # 12
say "2 ** 10    = " . (2 ** 10);      # 1024

# From POSIX module
say "floor(3.7) = " . floor(3.7);     # 3
say "ceil(3.2)  = " . ceil(3.2);      # 4
say "floor(-3.7)= " . floor(-3.7);    # -4
say "ceil(-3.2) = " . ceil(-3.2);     # -3

# Logarithm and exponent
say "log(1)     = " . log(1);         # 0
say "log(exp(1))= " . log(exp(1));    # 1 (natural log of e)
say "exp(1)     = " . exp(1);         # e = 2.718...

# Trig
use POSIX qw(sin cos);
my $pi = 4 * atan2(1, 1);   # calculate pi
say "pi = $pi";
say "sin(pi/2) = " . sin($pi / 2);   # 1
say "cos(0)    = " . cos(0);          # 1

# Max and min using List::Util
use List::Util qw(max min sum);
my @nums = (5, 3, 8, 1, 9, 2);
say "max = " . max(@nums);   # 9
say "min = " . min(@nums);   # 1
say "sum = " . sum(@nums);   # 28
