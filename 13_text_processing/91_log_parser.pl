#!/usr/bin/perl
# LESSON 91: Text Processing - Log File Analyser
# Parse structured log files and extract statistics

use strict;
use warnings;
use feature 'say';

# Simulated web server access log lines (Apache/Nginx combined log format)
my @log = (
    '192.168.1.1 - alice [15/Jan/2025:08:00:01 +0800] "GET /index.html HTTP/1.1" 200 1234',
    '10.0.0.5   - bob   [15/Jan/2025:08:00:05 +0800] "POST /api/login HTTP/1.1" 200 89',
    '192.168.1.1 - alice [15/Jan/2025:08:01:00 +0800] "GET /images/logo.png HTTP/1.1" 304 0',
    '172.16.0.2  - -     [15/Jan/2025:08:05:00 +0800] "GET /secret HTTP/1.1" 403 512',
    '10.0.0.5   - bob   [15/Jan/2025:08:10:00 +0800] "GET /dashboard HTTP/1.1" 200 4567',
    '1.2.3.4     - -     [15/Jan/2025:08:15:00 +0800] "GET /wp-admin HTTP/1.1" 404 234',
    '192.168.1.1 - alice [15/Jan/2025:08:20:00 +0800] "PUT /api/data HTTP/1.1" 500 45',
);

# Counters and collectors
my %stats = (
    ip     => {},    # requests per IP address
    status => {},    # count per HTTP status code
    method => {},    # count per HTTP method
    total_bytes => 0, # total bytes served
);

# Pre-compile the regex for efficiency (qr// creates a compiled regex object)
my $log_re = qr/^(\S+)\s+-\s+(\S+)\s+\[([^\]]+)\]\s+"(\w+)\s+(\S+)\s+HTTP\/[\d.]+"\s+(\d+)\s+(\d+)/;
# Field breakdown:
# (\S+)       = IP address (non-whitespace characters)
# \s+-\s+     = space, dash, space
# (\S+)       = username
# \[([^\]]+)\] = [timestamp] (any chars except ])
# "(\w+)      = HTTP method (GET/POST/etc.)
# (\S+)       = URL path
# HTTP/[\d.]+ = protocol version
# (\d+)       = status code
# (\d+)       = bytes transferred

for my $line (@log) {
    if ($line =~ $log_re) {
        my ($ip, $user, $time, $method, $path, $status, $bytes) = ($1,$2,$3,$4,$5,$6,$7);
        $stats{ip}{$ip}++;                              # count requests from this IP
        $stats{status}{$status}++;                      # count this status code
        $stats{method}{$method}++;                      # count this HTTP method
        $stats{total_bytes} += $bytes;                  # add bytes to total
    }
}

say "=== Log Analysis ===";
say "\nRequests per IP:";
printf "  %-15s : %d\n", $_, $stats{ip}{$_} for sort keys %{$stats{ip}};

say "\nHTTP Status codes:";
printf "  %s : %d\n", $_, $stats{status}{$_} for sort keys %{$stats{status}};

say "\nHTTP Methods:";
printf "  %-6s : %d\n", $_, $stats{method}{$_} for sort keys %{$stats{method}};

say "\nTotal bytes served: $stats{total_bytes}";

# Find error requests (status 400 and above)
say "\n=== HTTP Errors ===";
for my $line (@log) {
    if ($line =~ $log_re && $6 >= 400) {   # $6 = status code in the match
        say "  ERROR $6: " . substr($line, 0, 70);   # show first 70 chars
    }
}
