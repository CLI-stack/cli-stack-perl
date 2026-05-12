#!/usr/bin/perl
# LESSON 66: Lookahead and Lookbehind
# Zero-width assertions that match a position WITHOUT consuming characters

use strict;
use warnings;
use feature 'say';

# Lookahead (?=...) - match ONLY IF followed by a specific pattern
# The lookahead itself does NOT appear in the match
my $text = "price: 100 and 200 but also 50";

# Match digits that are followed by the word " and"
while ($text =~ /(\d+)(?= and)/g) {    # (?= and) = must be followed by " and"
    say "Before 'and': $1";             # matches 100 (the one before " and")
}

# Negative lookahead (?!...) - match ONLY IF NOT followed by a pattern
my $str = "color colour colonel column";
while ($str =~ /\bcol(?!our)\w*/g) {   # col NOT followed by "our"
    say "Not 'colour' word: $&";        # $& = the entire matched string
}

# Lookbehind (?<=...) - match ONLY IF preceded by a specific pattern
# Lookbehind also does NOT consume the preceding text
my $prices = "USD 100, EUR 200, USD 50, EUR 75";
while ($prices =~ /(?<=USD )\d+/g) {   # digits that come after "USD "
    say "USD amount: $&";               # matches 100 and 50
}

# Negative lookbehind (?<!...) - match ONLY IF NOT preceded by a pattern
my $data = "100cm 200m 50km 300mm";
while ($data =~ /\d+(?<!k)m\b/g) {    # \d+ followed by m, but NOT preceded by k (not km)
    say "Non-km measurement: $&";
}

# Practical: insert commas into a large number (1234567 -> 1,234,567)
sub add_commas {
    my $n = reverse shift;              # reverse the digits: 7654321
    $n =~ s/(\d{3})(?=\d)/$1,/g;      # after every 3 digits (if more follow), add comma
    return scalar reverse $n;          # reverse back: 1,234,567
}

say "\n=== Comma formatting ===";
say add_commas(1234567);     # 1,234,567
say add_commas(9876543210);  # 9,876,543,210
