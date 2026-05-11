#!/usr/bin/perl
# LESSON 5: String Interpolation vs Concatenation

use strict;
use warnings;
use feature 'say';

my $first = "John";
my $last  = "Doe";

# Double quotes: variables ARE expanded
say "Full name: $first $last";

# Single quotes: variables are NOT expanded (literal)
say 'Full name: $first $last';   # prints literally

# Concatenation with dot operator
my $full = $first . " " . $last;
say "Concatenated: $full";

# Embedding expressions in strings with ${}
my $a = 5;
my $b = 3;
say "Sum is: ${\ ($a + $b) }";   # expression inside string

# Repeating a string with x operator
my $line = "-" x 30;
say $line;
say "Hello Perl!";
say $line;
