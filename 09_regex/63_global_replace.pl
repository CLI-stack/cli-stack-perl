#!/usr/bin/perl
# LESSON 63: Capture Groups in Regex
# Parentheses () capture matched text so you can reuse it

use strict;
use warnings;
use feature 'say';

# Parentheses create a "capture group" - the matched text is stored in $1, $2, etc.
my $date = "2025-01-15";
if ($date =~ /(\d{4})-(\d{2})-(\d{2})/) {  # three capture groups
    say "Year : $1";   # $1 = what the first () captured  -> 2025
    say "Month: $2";   # $2 = what the second () captured -> 01
    say "Day  : $3";   # $3 = what the third () captured  -> 15
}

# With /g flag in LIST context: returns ALL matches at once
my $text    = "My numbers are 42, 17, and 99.";
my @numbers = ($text =~ /(\d+)/g);    # find all sequences of digits
say "\nAll numbers: " . join(", ", @numbers);  # 42, 17, 99

# Named captures: (?<name>...) gives each group a descriptive name
# Access with $+{name} instead of $1, $2 etc.
my $log = "2025-01-15 14:30:55 ERROR Server failed";
if ($log =~ /(?<date>\d{4}-\d{2}-\d{2}) (?<time>\d{2}:\d{2}:\d{2}) (?<level>\w+) (?<msg>.+)/) {
    say "\nNamed captures:";
    say "  Date  : $+{date}";    # access by name: much more readable than $1, $2
    say "  Time  : $+{time}";
    say "  Level : $+{level}";
    say "  Msg   : $+{msg}";
}

# Non-capturing group (?:...) - group WITHOUT storing in $1/$2/etc.
my $url = "https://www.example.com/path";
if ($url =~ m{(?:https?|ftp)://([^/]+)(/.*)?}) {  # (?:...) groups but doesn't capture
    say "\nDomain: $1";                              # $1 = domain (the capturing group)
    say "Path  : " . ($2 // "/");                   # $2 = path (optional)
}

# Backreference \1 - refers back to what group 1 matched WITHIN THE SAME PATTERN
my $doubled = "hello hello world world";
while ($doubled =~ /\b(\w+) \1\b/g) {   # \1 matches the SAME word as captured in $1
    say "Duplicate word found: '$1'";    # finds repeated words
}
