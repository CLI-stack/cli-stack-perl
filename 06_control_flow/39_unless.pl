#!/usr/bin/perl
# LESSON 39: unless and until - Negated Control Flow
# unless = if NOT; until = while NOT

use strict;
use warnings;
use feature 'say';

my $logged_in = 0;   # 0 means false - user is not logged in

# unless runs its block when the condition is FALSE
unless ($logged_in) {
    say "Please log in first.";   # this runs because logged_in is false (0)
}

# Equivalent using if - unless is cleaner for "if not" conditions
if (!$logged_in) {
    say "Please log in first (if version).";   # same result, less readable
}

# Postfix unless - put condition after the statement
say "Guest mode active" unless $logged_in;    # prints because $logged_in is false

my $file_found = 1;                           # 1 = true - file was found
say "File missing!" unless $file_found;       # won't print because file WAS found

# unless with else (use sparingly - can be confusing to read)
unless ($logged_in) {
    say "Not logged in.";     # condition is false, so this runs
} else {
    say "Logged in.";         # would run if logged_in were true
}

# until loop - keeps looping UNTIL the condition becomes true (= while NOT true)
my $count = 0;
until ($count >= 5) {         # keep looping while count is LESS than 5
    say "Count: $count";
    $count++;                 # increment; when count hits 5, loop stops
}

# Postfix until - one-liner loop
$count = 0;
$count++ until $count == 3;   # increment until $count equals 3
say "Final count: $count";    # prints: 3

# Practical: retry until success or max attempts
my $retries = 0;
my $success = 0;
until ($success || $retries >= 3) {   # stop when success OR too many retries
    $retries++;
    say "Attempt $retries...";
    $success = 1 if $retries == 2;    # simulate success on 2nd attempt
}
say $success ? "Succeeded!" : "Failed after $retries attempts";
