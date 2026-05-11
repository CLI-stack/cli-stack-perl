#!/usr/bin/perl
# LESSON 38: if / elsif / else

use strict;
use warnings;
use feature 'say';

my $score = 75;

# Basic if/elsif/else
if ($score >= 90) {
    say "Grade: A";
} elsif ($score >= 80) {
    say "Grade: B";
} elsif ($score >= 70) {
    say "Grade: C";
} elsif ($score >= 60) {
    say "Grade: D";
} else {
    say "Grade: F";
}

# Postfix if (one-liner style)
say "Passed!" if $score >= 60;
say "Failed!" if $score < 60;

# Logical operators in conditions
my $age    = 25;
my $has_id = 1;

if ($age >= 18 && $has_id) {
    say "Access granted";
}

if ($age < 18 || !$has_id) {
    say "Access denied";
} else {
    say "Welcome!";
}

# Nested if
my $temp = 28;
if ($temp > 25) {
    if ($temp > 35) {
        say "Very hot!";
    } else {
        say "Warm";
    }
} else {
    say "Cool";
}

# unless = if NOT
unless ($score < 60) {
    say "You passed (using unless)";
}
