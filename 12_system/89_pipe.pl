#!/usr/bin/perl
# LESSON 89: Pipes - Connect Perl to External Commands via Streams
# More powerful than backticks: stream data to/from commands line by line

use strict;
use warnings;
use feature 'say';
use IPC::Open2;   # for two-way communication with a command

# Open a READ pipe with '-|': read the output of a command line by line
# Safer than backticks for large output - doesn't load everything into memory at once
say "=== Reading from command via pipe ===";
open(my $pipe, '-|', 'ls', '/tmp') or die "Cannot open pipe: $!";
# '-|' = we will READ from the command; 'ls', '/tmp' = the command and its arguments

my $count = 0;
while (my $line = <$pipe>) {   # read one line at a time from the command
    chomp $line;
    say "  $line";
    last if ++$count >= 5;     # only show first 5 entries
}
close($pipe);   # close the pipe when done; Perl waits for the command to finish

# Check if the command succeeded
if ($? != 0) {
    warn "Command failed with code: " . ($? >> 8) . "\n";
}

# Open a WRITE pipe with '|-': send data INTO a command
say "\n=== Writing to command via pipe ===";
open(my $wpipe, '|-', 'sort') or die "Cannot open write pipe: $!";
# '|-' = we will WRITE to the command; 'sort' will receive our data

print $wpipe "banana\n";   # write lines to the sort command
print $wpipe "apple\n";
print $wpipe "cherry\n";
print $wpipe "date\n";
close($wpipe);             # closing triggers command to process and print results

# IPC::Open2 - two-way pipe: write TO command AND read FROM it simultaneously
say "\n=== IPC::Open2 (bidirectional) ===";
my ($out, $in);
my $pid = open2($out, $in, 'cat');   # 'cat' echoes everything we send back to us
# $out = filehandle to READ FROM the command
# $in  = filehandle to WRITE TO the command

print $in "hello from Perl\n";   # send a line to 'cat'
close($in);                       # signal end of input to 'cat'
my $result = <$out>;              # read the line back
chomp $result;
say "Got back: $result";          # prints: hello from Perl
waitpid $pid, 0;                  # wait for the child process to finish
