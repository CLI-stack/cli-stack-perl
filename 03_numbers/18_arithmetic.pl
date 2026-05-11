#!/usr/bin/perl
# LESSON 18: Arithmetic Operations

use strict;
use warnings;
use feature 'say';

my $a = 20;
my $b = 6;

say "a = $a, b = $b";
say "Addition       : " . ($a + $b);   # 26
say "Subtraction    : " . ($a - $b);   # 14
say "Multiplication : " . ($a * $b);   # 120
say "Division       : " . ($a / $b);   # 3.333...
say "Integer div    : " . int($a / $b); # 3
say "Modulo (%)     : " . ($a % $b);   # 2
say "Exponentiation : " . ($a ** 2);   # 400

# Increment / Decrement
my $x = 5;
$x++;    # post-increment: use then add
say "After ++: $x";   # 6
$x--;    # post-decrement
say "After --: $x";   # 5

# Compound assignment
$x += 10;  say "+= 10: $x";   # 15
$x -= 3;   say "-= 3 : $x";   # 12
$x *= 2;   say "*= 2 : $x";   # 24
$x /= 4;   say "/= 4 : $x";   # 6
$x **= 2;  say "**= 2: $x";   # 36
$x %= 10;  say "%= 10: $x";   # 6

# Integer check
say int(3.9);   # 3  (truncates, no rounding)
say int(-3.9);  # -3
