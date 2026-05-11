#!/usr/bin/perl
# LESSON 66: Lookahead and Lookbehind

use strict;
use warnings;
use feature 'say';

# Lookahead (?=...) - match only if followed by...
my $text = "price: $100 and $200 but euros: 50";

# Match digits followed by a word (but don't include the word)
while ($text =~ /(\d+)(?= and)/g) {
    say "Before 'and': $1";
}

# Negative lookahead (?!...) - match only if NOT followed by
my @words = qw(color colour favor favour);
for my $w (@words) {
    if ($w =~ /colou?r/ && $w !~ /colou(?=r)/) {
        # simplified - just use standard regex below
    }
}

# Find 'col' NOT followed by 'our'
my $str = "color colour colonel column";
while ($str =~ /\bcol(?!our)\w*/g) {
    say "Not 'colour': $&";
}

# Lookbehind (?<=...) - match only if preceded by
my $prices = "USD 100, EUR 200, USD 50, EUR 75";
while ($prices =~ /(?<=USD )\d+/g) {
    say "USD amount: $&";
}

# Negative lookbehind (?<!...)
my $data = "100cm 200m 50km 300mm";
while ($data =~ /\d+(?<!k)m\b/g) {
    # matches m but not km
    say "Non-km meters: $&";
}

# Practical: add commas to a number
sub add_commas {
    my $n = reverse shift;
    $n =~ s/(\d{3})(?=\d)/$1,/g;
    return scalar reverse $n;
}

say "\nFormatted: " . add_commas(1234567);
say "Formatted: " . add_commas(9876543210);
