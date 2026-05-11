#!/usr/bin/perl
# LESSON 63: Capture Groups in Regex

use strict;
use warnings;
use feature 'say';

# Parentheses capture matched text into $1, $2, etc.
my $date = "2025-01-15";

if ($date =~ /(\d{4})-(\d{2})-(\d{2})/) {
    say "Year : $1";
    say "Month: $2";
    say "Day  : $3";
}

# Capture multiple matches with /g in list context
my $text = "My numbers are 42, 17, and 99.";
my @numbers = ($text =~ /(\d+)/g);
say "\nAll numbers: " . join(", ", @numbers);

# Named captures with (?<name>...)
my $log = "2025-01-15 14:30:55 ERROR Server failed";
if ($log =~ /(?<date>\d{4}-\d{2}-\d{2}) (?<time>\d{2}:\d{2}:\d{2}) (?<level>\w+) (?<msg>.+)/) {
    say "\nNamed captures:";
    say "  Date  : $+{date}";
    say "  Time  : $+{time}";
    say "  Level : $+{level}";
    say "  Msg   : $+{msg}";
}

# Non-capturing group (?:...) - group without storing
my $url = "https://www.example.com/path";
if ($url =~ m{(?:https?|ftp)://([^/]+)(/.*)?}) {
    say "\nDomain: $1";
    say "Path  : " . ($2 // "/");
}

# Backreference \1 - refers to captured group
my $doubled = "hello hello world world";
while ($doubled =~ /\b(\w+) \1\b/g) {
    say "Duplicate word found: '$1'";
}
