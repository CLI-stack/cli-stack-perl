#!/usr/bin/perl
# LESSON 44: do-while and do-until

use strict;
use warnings;
use feature 'say';

# do-while: runs body AT LEAST ONCE, then checks condition
say "--- do-while ---";
my $i = 10;
do {
    say "i = $i";
    $i++;
} while ($i < 5);   # condition false immediately, but body ran once!

# Contrast with regular while (body never runs):
say "\n--- regular while (never runs) ---";
$i = 10;
while ($i < 5) {
    say "This never prints";
}
say "Regular while skipped";

# do-until: run until condition is true
say "\n--- do-until ---";
my $count = 1;
do {
    say "count = $count";
    $count++;
} until ($count > 3);

# Practical: keep asking until valid input
say "\n--- Input validation loop ---";
my $attempts = 0;
my $valid_answer;
do {
    $attempts++;
    # Simulate user input (in real code this would be <STDIN>)
    my @inputs = ("bad", "still bad", "42");
    my $input = $inputs[$attempts - 1] // "";
    say "Attempt $attempts: got '$input'";
    if ($input =~ /^\d+$/) {
        $valid_answer = $input;
    }
} until (defined $valid_answer || $attempts >= 5);

say "Valid input: $valid_answer" if defined $valid_answer;
