#!/usr/bin/perl
# LESSON 19: Comparison Operators

use strict;
use warnings;
use feature 'say';

# Numeric comparisons
my ($a, $b) = (10, 20);

say "Numeric comparisons:";
say "$a == $b ? " . ($a == $b ? "yes" : "no");   # no
say "$a != $b ? " . ($a != $b ? "yes" : "no");   # yes
say "$a <  $b ? " . ($a <  $b ? "yes" : "no");   # yes
say "$a >  $b ? " . ($a >  $b ? "yes" : "no");   # no
say "$a <= $b ? " . ($a <= $b ? "yes" : "no");   # yes
say "$a >= $b ? " . ($a >= $b ? "yes" : "no");   # no

# String comparisons
my ($s1, $s2) = ("apple", "banana");
say "\nString comparisons:";
say "'$s1' eq '$s2' ? " . ($s1 eq $s2 ? "yes" : "no");
say "'$s1' ne '$s2' ? " . ($s1 ne $s2 ? "yes" : "no");
say "'$s1' lt '$s2' ? " . ($s1 lt $s2 ? "yes" : "no");
say "'$s1' gt '$s2' ? " . ($s1 gt $s2 ? "yes" : "no");

# Spaceship operator <=> (numeric: -1, 0, 1)
say "\nSpaceship operator:";
say 5 <=> 10;    # -1
say 10 <=> 10;   #  0
say 15 <=> 10;   #  1

# cmp (string spaceship)
say "apple" cmp "banana";   # -1
say "same"  cmp "same";     #  0
say "zebra" cmp "apple";    #  1
