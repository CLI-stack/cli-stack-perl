#!/usr/bin/perl
# LESSON 5: String Interpolation vs Concatenation
# Interpolation = Perl replaces variable names with their values inside strings

use strict;
use warnings;
use feature 'say';

my $first = "John";   # store first name in $first
my $last  = "Doe";    # store last name in $last

say "Full name: $first $last";   # double quotes: $first and $last ARE replaced with their values
say 'Full name: $first $last';   # single quotes: variables are NOT replaced - printed literally

my $full = $first . " " . $last;  # . joins strings together (concatenation)
say "Concatenated: $full";         # prints: Concatenated: John Doe

my $a = 5;   # store 5 in $a
my $b = 3;   # store 3 in $b

say "Sum is: ${\ ($a + $b) }";  # ${\ expr } lets you embed any expression inside a string
                                 # \( ) creates a reference to the result, ${ } dereferences it

my $line = "-" x 30;  # x is the repetition operator - repeat "-" exactly 30 times
say $line;            # prints 30 dashes as a separator
say "Hello Perl!";    # main content
say $line;            # prints 30 dashes again
