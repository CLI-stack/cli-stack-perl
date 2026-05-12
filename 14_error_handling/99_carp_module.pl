#!/usr/bin/perl
# LESSON 99: Carp Module - Better Error Location Reporting
# Carp makes errors point to WHERE THE CALLER MADE THE MISTAKE
# instead of where your library code detected it

use strict;
use warnings;
use feature 'say';
use Carp qw(carp croak confess cluck);
# carp    = like warn, but reports from the CALLER'S file/line
# croak   = like die,  but reports from the CALLER'S file/line
# cluck   = like warn, but includes full stack trace
# confess = like die,  but includes full stack trace

# Without Carp: "Error at MyLib.pm line 5" - not helpful, you already know that
# With croak:   "Error at main.pl line 12" - tells you WHERE the bad call was made

package Validator;
use Carp qw(carp croak);

sub validate_age {
    my ($class, $age) = @_;
    croak "Age must be a positive number (got: $age)"   # croak reports from CALLER'S location
        unless defined $age && $age =~ /^\d+$/ && $age > 0;
    carp "Age $age seems unrealistically high"          # carp = warning from caller's location
        if $age > 150;
    return 1;   # valid
}

package main;

say "=== croak from Validator ===";
eval { Validator->validate_age(-5) };     # invalid age - will croak
say "Error: $@" if $@;                   # error message points to THIS line (main.pl)

eval { Validator->validate_age(200) };    # valid number but high - will carp (warning)
say "200 passed validation (with warning)" unless $@;

# confess - die with complete call stack trace (best for debugging deep problems)
package DeepModule;
use Carp 'confess';

sub level3 { confess "Deep error with full stack trace" }  # die from here
sub level2 { level3() }   # called by level2
sub level1 { level2() }   # called by level1

package main;

say "\n=== confess (full stack trace) ===";
eval { DeepModule::level1() };   # chain of calls leading to confess
if ($@) {
    my @trace = split /\n/, $@;       # split trace into individual lines
    say $_ for @trace[0..2];          # show first 3 lines of the trace
    say "... (stack trace continues)" if @trace > 3;
}

# GUIDELINE:
# - Use die/warn in SCRIPTS (main programs)
# - Use croak/carp in MODULES/LIBRARIES (code others call)
say "\nUse croak/carp in reusable modules, die/warn in scripts.";
