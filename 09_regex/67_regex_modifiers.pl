#!/usr/bin/perl
# LESSON 67: Validate Input with Regex
# Practical regex patterns for validating email, phone, and URLs

use strict;
use warnings;
use feature 'say';

# Email validation
sub is_valid_email {
    my $email = shift;
    # Pattern breakdown:
    # ^                = start of string
    # [a-zA-Z0-9._%+\-]+ = local part: letters, digits, and common symbols
    # \@               = literal @ sign
    # [a-zA-Z0-9.\-]+  = domain: letters, digits, dots, hyphens
    # \.               = literal dot before TLD
    # [a-zA-Z]{2,}     = TLD: at least 2 letters
    # $                = end of string
    return $email =~ /^[a-zA-Z0-9._%+\-]+\@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$/;
}

my @emails = (
    'alice@example.com',         # valid
    'bob.smith@company.co.uk',   # valid - subdomain and country TLD
    'invalid-email',             # no @ sign
    'missing@dot',               # no dot in domain
    'user@domain.org',           # valid
    '@nodomain.com',             # no local part
    'valid+tag@gmail.com',       # valid - + is allowed in local part
);

say "Email validation:";
for my $email (@emails) {
    printf "  %-30s => %s\n", $email, is_valid_email($email) ? "VALID" : "INVALID";
}

# Malaysian phone number validation
sub is_valid_my_phone {
    my $phone = shift;
    $phone =~ s/[\s\-\(\)]//g;     # remove spaces, dashes, and parentheses first
    # \+?60 = optional + then 60 (country code), OR leading 0
    # [1-9]  = first digit after code (not 0)
    # \d{7,9} = 7 to 9 more digits
    return $phone =~ /^(\+?60|0)[1-9]\d{7,9}$/;
}

my @phones = ("012-3456789", "+60123456789", "03-12345678", "1234", "0123456789");
say "\nPhone validation (Malaysian):";
for my $p (@phones) {
    printf "  %-15s => %s\n", $p, is_valid_my_phone($p) ? "VALID" : "INVALID";
}

# URL validation
sub is_valid_url {
    my $url = shift;
    # https?:// = http or https
    # [a-zA-Z0-9\-\.]+ = hostname
    # \.[a-zA-Z]{2,}  = dot then TLD
    # (/.*)?           = optional path
    return $url =~ m{^https?://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(/.*)?$};
}

my @urls = ("https://example.com", "http://sub.domain.co.uk/path", "ftp://nope.com", "not-a-url");
say "\nURL validation:";
for my $u (@urls) {
    printf "  %-40s => %s\n", $u, is_valid_url($u) ? "VALID" : "INVALID";
}
