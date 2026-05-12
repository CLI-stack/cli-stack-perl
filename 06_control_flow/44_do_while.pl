#!/usr/bin/perl
# LESSON 44: do-while and do-until
# Loops that check the condition AFTER running the body - guaranteed to run at least once

use strict;
use warnings;
use feature 'say';

# do-while: run block FIRST, THEN check condition
say "--- do-while (runs even when condition is already false) ---";
my $i = 10;
do {
    say "i = $i";    # this runs ONCE even though 10 < 5 is false
    $i++;
} while ($i < 5);   # condition checked AFTER the block; false immediately so loop ends
# Regular while would NEVER execute the body here

# Contrast with regular while - body never runs if condition starts false
say "\n--- regular while skips entirely ---";
$i = 10;
while ($i < 5) {
    say "This never prints";   # condition is false at start, block never entered
}
say "Regular while was skipped";

# do-until: run block FIRST, then stop when condition becomes TRUE
say "\n--- do-until ---";
my $count = 1;
do {
    say "count = $count";
    $count++;
} until ($count > 3);   # stop WHEN count exceeds 3; so runs for count=1,2,3

# Practical: input validation - always ask at least once
say "\n--- Input validation (simulate 3 attempts) ---";
my $attempts     = 0;
my $valid_answer;
do {
    $attempts++;                                  # count each attempt
    my @inputs  = ("bad", "still bad", "42");    # simulated user inputs
    my $input   = $inputs[$attempts - 1] // "";  # get simulated input for this attempt
    say "Attempt $attempts: got '$input'";
    if ($input =~ /^\d+$/) {                     # /^\d+$/ = only digits, whole string
        $valid_answer = $input;                   # valid! store the answer
    }
} until (defined $valid_answer || $attempts >= 5);  # stop when valid or max tries reached

say "Valid input: $valid_answer" if defined $valid_answer;
