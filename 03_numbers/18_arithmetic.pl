#!/usr/bin/perl
# LESSON 18: Arithmetic Operations
# Basic math operations you can do on numbers in Perl

use strict;
use warnings;
use feature 'say';

my $a = 20;   # first number
my $b = 6;    # second number

say "a = $a, b = $b";
say "Addition       : " . ($a + $b);    # + adds two numbers -> 26
say "Subtraction    : " . ($a - $b);    # - subtracts        -> 14
say "Multiplication : " . ($a * $b);    # * multiplies       -> 120
say "Division       : " . ($a / $b);    # / divides - result is 3.333...
say "Integer div    : " . int($a / $b); # int() truncates decimal part -> 3
say "Modulo (%)     : " . ($a % $b);    # % gives the REMAINDER after division -> 2
say "Exponentiation : " . ($a ** 2);    # ** raises to a power -> 400

my $x = 5;   # variable we will increment and decrement
$x++;        # ++ adds 1 to $x (same as $x = $x + 1)
say "After ++: $x";   # prints 6

$x--;        # -- subtracts 1 from $x (same as $x = $x - 1)
say "After --: $x";   # prints 5

# Compound assignment operators - shorthand for common operations
$x += 10;  say "+= 10: $x";   # $x = $x + 10  -> 15
$x -= 3;   say "-= 3 : $x";   # $x = $x - 3   -> 12
$x *= 2;   say "*= 2 : $x";   # $x = $x * 2   -> 24
$x /= 4;   say "/= 4 : $x";   # $x = $x / 4   -> 6
$x **= 2;  say "**= 2: $x";   # $x = $x ** 2  -> 36
$x %= 10;  say "%= 10: $x";   # $x = $x % 10  -> 6

say int(3.9);   # int() TRUNCATES (does not round) -> 3
say int(-3.9);  # negative truncation goes toward zero -> -3
