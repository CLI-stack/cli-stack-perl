#!/usr/bin/perl
# LESSON 94: Line Numbering and File Filtering
# Print files with line numbers, filter by pattern, and extract ranges

use strict;
use warnings;
use feature 'say';

# Create a test file to work with
my $file = "/tmp/poem.txt";
open(my $fh, '>', $file) or die $!;
print $fh <<'END';
Roses are red
Violets are blue
Perl is awesome
And so are you

The quick brown fox
Jumps over
The lazy dog

Hello World
Goodbye World
END
close($fh);

# Print with line numbers - like 'cat -n'
say "=== With Line Numbers ===";
open($fh, '<', $file) or die $!;
while (my $line = <$fh>) {
    chomp $line;
    printf "%3d: %s\n", $., $line;   # $. is a special Perl variable = current line number
}
close($fh);   # closing resets $. back to 0

# Print only lines that MATCH a pattern (like 'grep World file')
say "\n=== Lines matching 'World' ===";
open($fh, '<', $file) or die $!;
while (<$fh>) {       # $_ = each line
    print if /World/;  # print only if $_ matches the pattern
}
close($fh);

# Print lines that do NOT match (like 'grep -v World file')
say "\n=== Lines NOT matching 'World' (non-empty) ===";
open($fh, '<', $file) or die $!;
while (<$fh>) {
    next if /World/;       # skip lines containing "World"
    next if /^\s*$/;       # skip blank lines (only whitespace)
    print;                  # print all remaining lines
}
close($fh);

# Print only a RANGE of lines (e.g., lines 3 through 6)
say "\n=== Lines 3 to 6 ===";
open($fh, '<', $file) or die $!;
while (my $line = <$fh>) {
    print $line if $. >= 3 && $. <= 6;   # $. = current line number
}
close($fh);

# Count lines matching a pattern
open($fh, '<', $file) or die $!;
my $matches = grep { /the/i } <$fh>;   # grep in list context tests each line
close($fh);
say "\nLines containing 'the' (case-insensitive): $matches";
