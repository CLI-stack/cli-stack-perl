#!/usr/bin/perl
# LESSON 19: Comparison Operators
# Perl has separate operators for comparing numbers vs strings

use strict;
use warnings;
use feature 'say';

# NUMERIC comparison operators (use for numbers only)
my ($a, $b) = (10, 20);   # assign 10 to $a and 20 to $b at once

say "Numeric comparisons:";
say "$a == $b ? " . ($a == $b ? "yes" : "no");   # == checks numeric equality -> no
say "$a != $b ? " . ($a != $b ? "yes" : "no");   # != checks numeric inequality -> yes
say "$a <  $b ? " . ($a <  $b ? "yes" : "no");   # < less than -> yes
say "$a >  $b ? " . ($a >  $b ? "yes" : "no");   # > greater than -> no
say "$a <= $b ? " . ($a <= $b ? "yes" : "no");   # <= less than or equal -> yes
say "$a >= $b ? " . ($a >= $b ? "yes" : "no");   # >= greater than or equal -> no

# STRING comparison operators (use for strings only)
my ($s1, $s2) = ("apple", "banana");  # two strings to compare

say "\nString comparisons:";
say "'$s1' eq '$s2' ? " . ($s1 eq $s2 ? "yes" : "no");  # eq = string equal
say "'$s1' ne '$s2' ? " . ($s1 ne $s2 ? "yes" : "no");  # ne = string not equal
say "'$s1' lt '$s2' ? " . ($s1 lt $s2 ? "yes" : "no");  # lt = alphabetically less than
say "'$s1' gt '$s2' ? " . ($s1 gt $s2 ? "yes" : "no");  # gt = alphabetically greater than

# Spaceship operator <=> returns -1, 0, or 1 (used in sort)
say "\nSpaceship operator (numeric):";
say 5  <=> 10;   # 5 < 10  -> returns -1 (left is smaller)
say 10 <=> 10;   # equal   -> returns  0
say 15 <=> 10;   # 15 > 10 -> returns  1 (left is bigger)

# cmp is the string version of <=> (also used in sort)
say "apple" cmp "banana";   # alphabetically a < b -> -1
say "same"  cmp "same";     # equal               ->  0
say "zebra" cmp "apple";    # z > a               ->  1
