#!/usr/bin/perl
# LESSON 91: Text Processing - Log Parser

use strict;
use warnings;
use feature 'say';

# Simulate a web server access log (Apache/Nginx combined log format)
my @log = (
    '192.168.1.1 - alice [15/Jan/2025:08:00:01 +0800] "GET /index.html HTTP/1.1" 200 1234',
    '10.0.0.5   - bob   [15/Jan/2025:08:00:05 +0800] "POST /api/login HTTP/1.1" 200 89',
    '192.168.1.1 - alice [15/Jan/2025:08:01:00 +0800] "GET /images/logo.png HTTP/1.1" 304 0',
    '172.16.0.2  - -     [15/Jan/2025:08:05:00 +0800] "GET /secret HTTP/1.1" 403 512',
    '10.0.0.5   - bob   [15/Jan/2025:08:10:00 +0800] "GET /dashboard HTTP/1.1" 200 4567',
    '1.2.3.4     - -     [15/Jan/2025:08:15:00 +0800] "GET /wp-admin HTTP/1.1" 404 234',
    '192.168.1.1 - alice [15/Jan/2025:08:20:00 +0800] "PUT /api/data HTTP/1.1" 500 45',
);

my %stats = (
    ip      => {},
    status  => {},
    method  => {},
    total_bytes => 0,
);

my $log_re = qr/^(\S+)\s+-\s+(\S+)\s+\[([^\]]+)\]\s+"(\w+)\s+(\S+)\s+HTTP\/[\d.]+"\s+(\d+)\s+(\d+)/;

for my $line (@log) {
    if ($line =~ $log_re) {
        my ($ip, $user, $time, $method, $path, $status, $bytes)
            = ($1, $2, $3, $4, $5, $6, $7);

        $stats{ip}{$ip}++;
        $stats{status}{$status}++;
        $stats{method}{$method}++;
        $stats{total_bytes} += $bytes;
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

# Find all 4xx and 5xx errors
say "\n=== Errors ===";
for my $line (@log) {
    if ($line =~ $log_re && $3 && $6 >= 400) {
        say "  ERROR: " . substr($line, 0, 80);
    }
    if ($line =~ $log_re) {
        my $status = $6;
        say "  ERROR: $line" if $status >= 400;
    }
}
