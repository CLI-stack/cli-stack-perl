#!/usr/bin/perl
# LESSON 46: Switch/Case in Perl - if/elsif chains and Dispatch Tables
# Perl has no built-in switch - use if/elsif or hash dispatch tables instead

use strict;
use warnings;
use feature 'say';

my $day = "Monday";   # the value we want to test

# if/elsif chain - equivalent to switch/case in other languages
if    ($day eq "Monday")   { say "Start of work week"  }
elsif ($day eq "Friday")   { say "TGIF!"               }
elsif ($day eq "Saturday") { say "Weekend!"             }
elsif ($day eq "Sunday")   { say "Rest day"             }
else                       { say "Regular working day"  }  # default case

# Hash dispatch table - cleaner when you have many options
# Keys are the values to match; values are anonymous subroutines (code refs)
my %actions = (
    Monday    => sub { say "Plan the week"      },   # sub { } = anonymous subroutine
    Tuesday   => sub { say "Team meeting"       },   # stored as a value in the hash
    Wednesday => sub { say "Midweek review"     },
    Thursday  => sub { say "Report writing"     },
    Friday    => sub { say "Wrap up and review" },
    Saturday  => sub { say "Rest or hobby"      },
    Sunday    => sub { say "Family time"        },
);

my $today = "Wednesday";
if (exists $actions{$today}) {
    $actions{$today}->();   # ->() calls the code reference stored in the hash
} else {
    say "Unknown day: $today";  # default if key not found
}

# do block returns a value - useful for assigning from conditions
my $score = 85;
my $grade = do {               # do {} runs the block and returns the last expression
    if    ($score >= 90) { "A" }   # each branch evaluates to a string
    elsif ($score >= 80) { "B" }
    elsif ($score >= 70) { "C" }
    else                 { "F" }
};
say "Score $score => Grade $grade";   # the result of do{} is assigned to $grade
