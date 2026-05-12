#!/usr/bin/perl
# LESSON 38: if / elsif / else
# Conditional execution - run different code depending on conditions

use strict;
use warnings;
use feature 'say';

my $score = 75;   # the score we will evaluate

# if/elsif/else chain - checks conditions from top to bottom, runs first true block
if ($score >= 90) {
    say "Grade: A";          # runs if score is 90 or above
} elsif ($score >= 80) {
    say "Grade: B";          # runs if score is 80-89
} elsif ($score >= 70) {
    say "Grade: C";          # runs if score is 70-79
} elsif ($score >= 60) {
    say "Grade: D";          # runs if score is 60-69
} else {
    say "Grade: F";          # runs if none of the above matched
}

# Postfix if - put the condition AFTER the statement (one-liner style)
say "Passed!" if $score >= 60;    # only prints if condition is true
say "Failed!" if $score < 60;     # won't print - condition is false

# Logical operators: && (AND), || (OR), ! (NOT)
my $age    = 25;
my $has_id = 1;    # 1 = true

if ($age >= 18 && $has_id) {         # BOTH must be true
    say "Access granted";
}

if ($age < 18 || !$has_id) {         # either condition true = denied
    say "Access denied";
} else {
    say "Welcome!";                   # neither condition was true
}

# Nested if - if inside another if
my $temp = 28;
if ($temp > 25) {             # outer condition: is it warm?
    if ($temp > 35) {         # inner condition: is it very hot?
        say "Very hot!";
    } else {
        say "Warm";           # warm but not extreme
    }
} else {
    say "Cool";               # 25 or below
}

# unless = the opposite of if (reads more naturally for negative conditions)
unless ($score < 60) {        # unless means "if NOT"
    say "You passed (using unless)";
}
