#!/usr/bin/perl
# LESSON 89: Pipes - Read/Write from External Commands

use strict;
use warnings;
use feature 'say';

# Open a pipe to READ from a command (like backticks but streaming)
say "=== Reading from a command via pipe ===";
open(my $pipe, '-|', 'ls', '/tmp') or die "Cannot open pipe: $!";
my $count = 0;
while (my $line = <$pipe>) {
    chomp $line;
    say "  $line";
    last if ++$count >= 5;
}
close($pipe);

# Check if command succeeded
if ($? != 0) {
    warn "Command failed with code: " . ($? >> 8) . "\n";
}

# Open a pipe to WRITE to a command
say "\n=== Writing to a command via pipe ===";
open(my $wpipe, '|-', 'sort') or die "Cannot open write pipe: $!";
print $wpipe "banana\n";
print $wpipe "apple\n";
print $wpipe "cherry\n";
print $wpipe "date\n";
close($wpipe);   # closing flushes and waits for command to finish

# Two-way pipe with IPC::Open2
use IPC::Open2;
say "\n=== IPC::Open2 (two-way) ===";
my ($out, $in);
my $pid = open2($out, $in, 'cat');
print $in "hello from perl\n";
close($in);
my $result = <$out>;
chomp $result;
say "Got back: $result";
waitpid $pid, 0;

# Practical: count words in a string using wc
open(my $wc, '|-', 'wc', '-w') or die $!;
print $wc "the quick brown fox jumps over the lazy dog\n";
close($wc);
