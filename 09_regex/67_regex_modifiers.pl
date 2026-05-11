#!/usr/bin/perl
# LESSON 67: Validate Email with Regex

use strict;
use warnings;
use feature 'say';

# A practical regex example - email validation
sub is_valid_email {
    my $email = shift;
    return $email =~ /^[a-zA-Z0-9._%+\-]+\@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$/;
}

my @emails = (
    "alice\@example.com",
    "bob.smith\@company.co.uk",
    "invalid-email",
    "missing\@dot",
    "user\@domain.org",
    "\@nodomain.com",
    "no\@tld.",
    "valid+tag\@gmail.com",
);

say "Email validation:";
for my $email (@emails) {
    printf "  %-30s => %s\n", $email, is_valid_email($email) ? "VALID" : "INVALID";
}

# Phone number validation (Malaysian format)
sub is_valid_my_phone {
    my $phone = shift;
    $phone =~ s/[\s\-\(\)]//g;   # remove spaces, dashes, brackets
    return $phone =~ /^(\+?60|0)[1-9]\d{7,9}$/;
}

my @phones = ("012-3456789", "+60123456789", "03-12345678", "1234", "0123456789");
say "\nPhone validation (MY):";
for my $p (@phones) {
    printf "  %-15s => %s\n", $p, is_valid_my_phone($p) ? "VALID" : "INVALID";
}

# URL validation
sub is_valid_url {
    my $url = shift;
    return $url =~ m{^https?://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(/.*)?$};
}

my @urls = ("https://example.com", "http://sub.domain.co.uk/path", "ftp://nope.com", "not-a-url");
say "\nURL validation:";
for my $u (@urls) {
    printf "  %-40s => %s\n", $u, is_valid_url($u) ? "VALID" : "INVALID";
}
