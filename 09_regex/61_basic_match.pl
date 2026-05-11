#!/usr/bin/perl
# LESSON 61: Basic Regex Matching

use strict;
use warnings;
use feature 'say';

# Match operator: =~ m/pattern/ (m is optional)
my $str = "Hello, Perl World!";

if ($str =~ /Perl/) {
    say "Found 'Perl' in string";
}

# Case-insensitive with /i flag
if ($str =~ /perl/i) {
    say "Found 'perl' (case insensitive)";
}

# Negated match with !~
unless ($str =~ /Python/) {
    say "No Python here";
}

# Match in a condition
my @words = qw(apple apricot banana avocado cherry);
for my $word (@words) {
    if ($word =~ /^a/) {
        say "'$word' starts with 'a'";
    }
}

# Common regex patterns:
my $tests = {
    "only digits"   => "12345",
    "has letters"   => "abc123",
    "email-like"    => "user\@example.com",
    "starts with A" => "Alice",
    "ends with ing" => "running",
};

for my $desc (sort keys %$tests) {
    my $val = $tests->{$desc};
    say "\n'$val' tests:";
    say "  digits only : " . ($val =~ /^\d+$/   ? "yes" : "no");
    say "  has \@       : " . ($val =~ /\@/      ? "yes" : "no");
    say "  starts with A: " . ($val =~ /^A/i     ? "yes" : "no");
    say "  ends with ing: " . ($val =~ /ing$/    ? "yes" : "no");
}
