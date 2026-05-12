#!/usr/bin/perl
# LESSON 70: Regex Practical - Full Log File Parser
# A complete real-world application of everything learned about regex

use strict;
use warnings;
use feature 'say';

# Simulate application log entries (common format used in production systems)
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

my %stats   = (INFO => 0, DEBUG => 0, WARN => 0, ERROR => 0);  # counts per level
my @errors;    # collected error messages
my @warnings;  # collected warning messages

for my $line (@log_lines) {
    # Parse each log line: date time level message
    # \d{4}-\d{2}-\d{2} = date, \d{2}:\d{2}:\d{2} = time, \w+ = level, .+ = message
    if ($line =~ /^(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2}:\d{2}) (\w+)\s+(.+)$/) {
        my ($date, $time, $level, $msg) = ($1, $2, $3, $4);   # unpack all captured groups
        $stats{$level}++ if exists $stats{$level};             # increment level counter
        push @errors,   "$time: $msg" if $level eq "ERROR";   # save error details
        push @warnings, "$time: $msg" if $level eq "WARN";    # save warning details
    }
}

say "=== Log Summary ===";
printf "  %-6s : %d\n", $_, $stats{$_} for qw(INFO DEBUG WARN ERROR);

say "\n=== Errors ===";
say "  $_" for @errors;     # print each error

say "\n=== Warnings ===";
say "  $_" for @warnings;   # print each warning

# Extract all port numbers mentioned anywhere in the log
my $all_text = join("\n", @log_lines);   # combine all lines into one string
my @ports;
push @ports, $1 while $all_text =~ /port (\d+)/g;   # find all "port NNN" occurrences
say "\n=== Ports mentioned ===";
say "  $_" for @ports;
