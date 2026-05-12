#!/usr/bin/perl
# LESSON 4: Comments and Code Style
# Comments are notes for humans - Perl ignores them completely

use strict;    # always include this
use warnings;  # always include this
use feature 'say'; # enable say()

# This is a single-line comment - everything after # is ignored by Perl

say "Comments help explain your code.";  # inline comment after code is also valid

# Multi-line comment block uses =pod ... =cut (called POD - Plain Old Documentation)
=pod
This entire block is a comment.
Perl skips everything between =pod and =cut.
Use it for long explanations or documentation.
=cut

say "Code continues after the POD block.";  # execution resumes here normally

my $x = 10;  # store the number 10 in $x
my $y = 20;  # store the number 20 in $y

say "Sum: " . ($x + $y);  # . is the string concatenation operator; brackets force math first
