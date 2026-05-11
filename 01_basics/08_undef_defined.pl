#!/usr/bin/perl
# LESSON 8: undef and defined()

use strict;
use warnings;
use feature 'say';

# undef = Perl's "nothing" / null value
my $x;           # declared but not assigned = undef
my $y = undef;   # explicitly set to undef

# defined() checks if a variable has a value
if (defined $x) {
    say "x is defined";
} else {
    say "x is undef (no value)";
}

# Assign and check again
$x = 0;
if (defined $x) {
    say "x is defined: $x";   # 0 is defined! (not undef)
}

# undef in numeric context = 0, in string context = ""
my $n = undef;
my $sum = $n + 5;   # warns: "Use of uninitialized value"
say "undef + 5 = $sum";

# Clear a variable back to undef
my $name = "Alice";
$name = undef;
say "name is " . (defined $name ? $name : "undef");
