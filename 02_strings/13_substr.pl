#!/usr/bin/perl
# LESSON 13: split() - Break Strings into Arrays

use strict;
use warnings;
use feature 'say';

# split(pattern, string)
my $csv = "Alice,Bob,Charlie,Dave";
my @names = split(/,/, $csv);

say "Number of names: " . scalar(@names);
foreach my $name (@names) {
    say "  - $name";
}

# Split on whitespace
my $sentence = "The quick brown fox";
my @words = split(/\s+/, $sentence);
say "Words: " . join(" | ", @words);

# Split with limit (max number of parts)
my $data = "one:two:three:four";
my @parts = split(/:/, $data, 2);   # only 2 parts
say "Part 1: $parts[0]";   # one
say "Part 2: $parts[1]";   # two:three:four

# Split each character
my $word = "Perl";
my @chars = split(//, $word);
say "Chars: " . join("-", @chars);   # P-e-r-l

# Split a log line
my $log = "2025-01-15 ERROR Connection timeout on port 8080";
my ($date, $level, @msg) = split(/\s+/, $log, 3);
say "Date : $date";
say "Level: $level";
say "Msg  : $msg[0]";
