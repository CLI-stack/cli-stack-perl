#!/usr/bin/perl
# LESSON 11: Case Conversion

use strict;
use warnings;
use feature 'say';

my $str = "Hello World from Perl";

say uc($str);     # HELLO WORLD FROM PERL
say lc($str);     # hello world from perl
say ucfirst($str);  # Hello world from perl (only first char)
say lcfirst($str);  # hELLO wORLD fROM pERL (lowercase first char)

# Practical: case-insensitive comparison
my $input = "YES";
if (lc($input) eq "yes") {
    say "User agreed!";
}

# Uppercase first letter of each word (title case)
my $title = "the quick brown fox";
$title =~ s/\b(\w)/uc($1)/ge;   # regex magic - covered in regex lessons
say "Title case: $title";

# Check if string is all uppercase
my $test = "PERL";
if ($test eq uc($test)) {
    say "'$test' is all uppercase";
}
