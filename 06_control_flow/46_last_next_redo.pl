#!/usr/bin/perl
# LESSON 46: given/when (Switch) using if/elsif chains

use strict;
use warnings;
use feature 'say';

# Perl doesn't have a clean switch/case like other languages.
# Best practice is if/elsif chains or hash dispatch tables.

my $day = "Monday";

# if/elsif chain (switch equivalent)
if    ($day eq "Monday")    { say "Start of work week" }
elsif ($day eq "Friday")    { say "TGIF!" }
elsif ($day eq "Saturday")  { say "Weekend!" }
elsif ($day eq "Sunday")    { say "Rest day" }
else                        { say "Regular day" }

# Hash dispatch table (cleaner for many options)
my %actions = (
    Monday    => sub { say "Plan the week" },
    Tuesday   => sub { say "Team meeting" },
    Wednesday => sub { say "Midweek review" },
    Thursday  => sub { say "Report writing" },
    Friday    => sub { say "Wrap up & review" },
    Saturday  => sub { say "Rest or hobby" },
    Sunday    => sub { say "Family time" },
);

my $today = "Wednesday";
if (exists $actions{$today}) {
    $actions{$today}->();   # call the code reference
} else {
    say "Unknown day: $today";
}

# Dispatch on number range
my $score = 85;
my $grade = do {
    if    ($score >= 90) { "A" }
    elsif ($score >= 80) { "B" }
    elsif ($score >= 70) { "C" }
    else                 { "F" }
};
say "Score $score => Grade $grade";
