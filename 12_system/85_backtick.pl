#!/usr/bin/perl
# LESSON 85: Backticks and qx// - Capture Command Output

use strict;
use warnings;
use feature 'say';

# Backticks capture output of a shell command
my $date = `date`;
chomp $date;
say "Date: $date";

# qx// is the same as backticks (more readable with special chars)
my $hostname = qx(hostname);
chomp $hostname;
say "Host: $hostname";

# Capture multiple lines
my $files = `ls /tmp | head -5`;
say "First 5 in /tmp:\n$files";

# Split output into lines
my @df_lines = `df -h`;
chomp @df_lines;
say "Disk usage:";
say "  $_" for @df_lines[0..2];

# Capture stderr too
my $output = `ls /nonexistent 2>&1`;
say "Error output: $output";

# Practical: get git info
if (-d ".git") {
    my $branch = `git rev-parse --abbrev-ref HEAD 2>/dev/null`;
    chomp $branch;
    say "Git branch: $branch";
}

# Capture and parse
my $whoami = `whoami`;
chomp $whoami;
say "Running as: $whoami";

# Environment info
my $perl_ver = `perl --version 2>/dev/null | head -2 | tail -1`;
chomp $perl_ver;
$perl_ver =~ s/^\s+//;
say "Perl version line: $perl_ver";

# IMPORTANT: avoid backticks with untrusted input (command injection risk!)
# Use a safer approach with open() and pipes instead.
