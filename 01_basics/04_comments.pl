#!/usr/bin/perl
# LESSON 4: Comments and Code Style
# Single-line comments start with #

use strict;
use warnings;
use feature 'say';

# This is a single-line comment

say "Comments help explain your code.";

# Multi-line comments use =pod ... =cut (POD documentation)
=pod
This is a multi-line comment block.
Perl calls this POD (Plain Old Documentation).
It is not executed.
=cut

say "Code continues after POD block.";

my $x = 10;  # inline comment - use sparingly
my $y = 20;

say "Sum: " . ($x + $y);  # . is string concatenation
