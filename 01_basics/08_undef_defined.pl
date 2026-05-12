#!/usr/bin/perl
# LESSON 8: undef and defined()
# undef is Perl's way of saying "this variable has no value"

use strict;
use warnings;
use feature 'say';

my $x;            # declared but NOT assigned - Perl automatically sets it to undef
my $y = undef;    # explicitly set to undef - same result as above

if (defined $x) {         # defined() returns true if the variable has ANY value (even 0 or "")
    say "x is defined";   # this block runs if $x has a value
} else {
    say "x is undef (no value)";  # this runs because $x was never assigned
}

$x = 0;                # assign 0 to $x - note: 0 is a valid value, NOT undef
if (defined $x) {
    say "x is defined: $x";  # prints because 0 IS defined - only undef is "undefined"
}

my $n = undef;      # $n has no value
my $sum = $n + 5;   # Perl converts undef to 0 in numeric context - this gives 5
                    # but also prints a warning: "Use of uninitialized value"
say "undef + 5 = $sum";   # prints: 5

my $name = "Alice";       # assign a string value
$name = undef;            # clear the variable - it now has no value again
say "name is " . (defined $name ? $name : "undef");
# ternary: if defined use $name, otherwise print the word "undef"
