#!/usr/bin/perl
# LESSON 99: Carp Module - Better Error Reporting

use strict;
use warnings;
use feature 'say';
use Carp qw(carp croak confess cluck);

# carp   = warn that reports from the CALLER's perspective
# croak  = die  that reports from the CALLER's perspective
# cluck  = warn with full stack trace
# confess= die  with full stack trace

# Without Carp: error points to the library, not the calling code
# With Carp:    error points to where the bad call was made

package Validator;
use Carp qw(carp croak);

sub validate_age {
    my ($class, $age) = @_;
    croak "Age must be a positive number (got: $age)"
        unless defined $age && $age =~ /^\d+$/ && $age > 0;
    carp "Age $age seems unusually high" if $age > 150;
    return 1;
}

package main;

say "=== croak from Validator ===";
eval { Validator->validate_age(-5) };
say "Error: $@" if $@;

eval { Validator->validate_age(200) };   # triggers carp (warning)
say "No error, just a warning above" unless $@;

# confess - full call stack
package DeepModule;
use Carp 'confess';

sub level3 { confess "Deep error with stack trace" }
sub level2 { level3() }
sub level1 { level2() }

package main;

say "\n=== confess stack trace ===";
eval { DeepModule::level1() };
if ($@) {
    # Print just first 3 lines of trace
    my @trace = split /\n/, $@;
    say $_ for @trace[0..2];
    say "... (stack trace continues)" if @trace > 3;
}

# Good practice: use Carp in modules, die/warn in scripts
say "\nBest practice: Carp in library code, die in main scripts";
