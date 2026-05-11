#!/usr/bin/perl
# LESSON 39: unless, until - Negated Control Flow

use strict;
use warnings;
use feature 'say';

my $logged_in = 0;

# unless = if NOT (reads more naturally in English)
unless ($logged_in) {
    say "Please log in first.";
}

# Same as:
if (!$logged_in) {
    say "Please log in first (if version).";
}

# Postfix unless
say "Guest mode active" unless $logged_in;

my $file_found = 1;
say "File missing!" unless $file_found;   # won't print

# unless with else (use sparingly - can be confusing)
unless ($logged_in) {
    say "Not logged in.";
} else {
    say "Logged in.";
}

# until loop = while NOT
my $count = 0;
until ($count >= 5) {
    say "Count: $count";
    $count++;
}

# Postfix until
$count = 0;
$count++ until $count == 3;
say "Final count: $count";

# Practical use
my $retries = 0;
my $success = 0;
until ($success || $retries >= 3) {
    $retries++;
    say "Attempt $retries...";
    $success = 1 if $retries == 2;   # simulate success on 2nd try
}
say $success ? "Succeeded!" : "Failed after $retries attempts";
