#!/usr/bin/perl
# LESSON 61: Basic Regex Matching
# Regex (regular expressions) let you search for patterns in strings

use strict;
use warnings;
use feature 'say';

# =~ is the "binding operator" - it applies a regex to a string
# m/pattern/ is the match operator (m is optional when using / /)
my $str = "Hello, Perl World!";

if ($str =~ /Perl/) {          # true if "Perl" appears anywhere in $str
    say "Found 'Perl' in string";
}

# /i flag = case-insensitive (ignores uppercase/lowercase difference)
if ($str =~ /perl/i) {
    say "Found 'perl' (case insensitive)";  # matches Perl, PERL, perl, etc.
}

# !~ is the "does NOT match" operator
unless ($str =~ /Python/) {     # unless = if not
    say "No Python here";        # prints because "Python" is NOT in $str
}

# Loop and test each element against a pattern
my @words = qw(apple apricot banana avocado cherry);
for my $word (@words) {
    if ($word =~ /^a/) {    # ^ anchors match to START of string; /a/ matches letter 'a'
        say "'$word' starts with 'a'";
    }
}

# Common regex anchors and character classes:
my $tests = {
    "only digits"    => "12345",
    "has letters"    => "abc123",
    "email-like"     => 'user@example.com',
    "starts with A"  => "Alice",
    "ends with ing"  => "running",
};

for my $desc (sort keys %$tests) {
    my $val = $tests->{$desc};
    say "\n'$val' tests:";
    say "  digits only  : " . ($val =~ /^\d+$/   ? "yes" : "no");  # ^\d+$ = only digits
    say "  has \@        : " . ($val =~ /\@/      ? "yes" : "no");  # \@ = literal @ sign
    say "  starts with A: " . ($val =~ /^A/i     ? "yes" : "no");  # ^A = starts with A
    say "  ends with ing : " . ($val =~ /ing$/   ? "yes" : "no");  # ing$ = ends with ing
}
