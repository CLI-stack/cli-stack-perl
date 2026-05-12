#!/usr/bin/perl
# LESSON 13: split() - Break a String into an Array
# split divides a string wherever a pattern matches

use strict;
use warnings;
use feature 'say';

# split(pattern, string) - splits string wherever pattern matches
my $csv   = "Alice,Bob,Charlie,Dave";   # comma-separated values
my @names = split(/,/, $csv);           # /,/ is a regex matching a comma

say "Number of names: " . scalar(@names);   # scalar() gives array count
foreach my $name (@names) {                 # loop through each split piece
    say "  - $name";                        # print each name
}

# Split on whitespace \s+ (one or more spaces/tabs)
my $sentence = "The quick brown fox";
my @words    = split(/\s+/, $sentence);      # \s+ matches any whitespace
say "Words: " . join(" | ", @words);         # join them back with " | " separator

# Split with a LIMIT - maximum number of pieces to produce
my $data  = "one:two:three:four";
my @parts = split(/:/, $data, 2);     # split into at most 2 parts
say "Part 1: $parts[0]";              # prints: one
say "Part 2: $parts[1]";              # prints: two:three:four (rest stays together)

# Split into individual characters using empty pattern //
my $word  = "Perl";
my @chars = split(//, $word);          # // splits between every character
say "Chars: " . join("-", @chars);     # prints: P-e-r-l

# Parse a log line using split with a limit
my $log = "2025-01-15 ERROR Connection timeout on port 8080";
my ($date, $level, @msg) = split(/\s+/, $log, 3);  # split into exactly 3 parts
say "Date : $date";    # prints: 2025-01-15
say "Level: $level";   # prints: ERROR
say "Msg  : $msg[0]";  # prints: Connection timeout on port 8080
