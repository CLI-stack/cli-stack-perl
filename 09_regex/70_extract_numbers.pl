#!/usr/bin/perl
# LESSON 70: Regex Practical - Log File Parser

use strict;
use warnings;
use feature 'say';

# Simulate a log file
my @log_lines = (
    "2025-01-15 08:00:01 INFO  Application started",
    "2025-01-15 08:00:02 DEBUG Loading config from /etc/app.conf",
    "2025-01-15 08:01:15 INFO  Listening on port 8080",
    "2025-01-15 08:05:30 WARN  Memory usage at 78%",
    "2025-01-15 08:10:00 ERROR Database connection failed: timeout after 30s",
    "2025-01-15 08:10:01 INFO  Retrying connection (attempt 1/3)",
    "2025-01-15 08:10:05 INFO  Retrying connection (attempt 2/3)",
    "2025-01-15 08:10:10 INFO  Database connected",
    "2025-01-15 08:30:00 WARN  Slow query detected: 2500ms",
    "2025-01-15 09:00:00 ERROR Out of disk space on /var/log",
);

my %stats = (INFO => 0, DEBUG => 0, WARN => 0, ERROR => 0);
my @errors;
my @warnings;

for my $line (@log_lines) {
    # Parse: date time level message
    if ($line =~ /^(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2}:\d{2}) (\w+)\s+(.+)$/) {
        my ($date, $time, $level, $msg) = ($1, $2, $3, $4);
        $stats{$level}++ if exists $stats{$level};
        push @errors,   "$time: $msg" if $level eq "ERROR";
        push @warnings, "$time: $msg" if $level eq "WARN";
    }
}

say "=== Log Summary ===";
printf "  %-6s : %d\n", $_, $stats{$_} for qw(INFO DEBUG WARN ERROR);

say "\n=== Errors ===";
say "  $_" for @errors;

say "\n=== Warnings ===";
say "  $_" for @warnings;

# Extract all ports mentioned
my @ports;
push @ports, $1 while join("\n", @log_lines) =~ /port (\d+)/g;
say "\n=== Ports mentioned ===";
say "  $_" for @ports;
