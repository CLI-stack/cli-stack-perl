#!/usr/bin/perl
# LESSON 94: Text Processing - Line Numbering and Filtering

use strict;
use warnings;
use feature 'say';

# Create test file
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

# Read with line numbers (like cat -n)
say "=== With Line Numbers ===";
open($fh, '<', $file) or die $!;
while (my $line = <$fh>) {
    chomp $line;
    printf "%3d: %s\n", $., $line;   # $. = current line number
}
close($fh);

# Print only lines matching a pattern (like grep)
say "\n=== Lines matching 'World' ===";
open($fh, '<', $file) or die $!;
while (<$fh>) {
    print if /World/;
}
close($fh);

# Print lines NOT matching (like grep -v)
say "\n=== Lines NOT matching 'World' (non-empty) ===";
open($fh, '<', $file) or die $!;
while (<$fh>) {
    next if /World/;
    next if /^\s*$/;   # skip blank lines
    print;
}
close($fh);

# Print line range (lines 3-6)
say "\n=== Lines 3 to 6 ===";
open($fh, '<', $file) or die $!;
while (my $line = <$fh>) {
    print $line if $. >= 3 && $. <= 6;
}
close($fh);

# Count matching lines
open($fh, '<', $file) or die $!;
my $matches = grep { /the/i } <$fh>;
close($fh);
say "\nLines containing 'the': $matches";
