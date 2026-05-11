#!/usr/bin/perl
# LESSON 56: Appending to Files

use strict;
use warnings;
use feature 'say';

my $logfile = "/tmp/perl_app.log";

# Append mode '>>' - adds to existing file, doesn't overwrite
sub write_log {
    my ($level, $message) = @_;
    open(my $fh, '>>', $logfile) or die "Cannot open log: $!";
    my $timestamp = scalar localtime();
    print $fh "[$timestamp] [$level] $message\n";
    close($fh);
}

# Write some log entries
write_log("INFO",  "Application started");
write_log("DEBUG", "Loading configuration");
write_log("INFO",  "Server listening on port 8080");
write_log("WARN",  "High memory usage detected");
write_log("ERROR", "Database connection timeout");
write_log("INFO",  "Reconnecting to database...");

# Read back the log
say "--- Log file contents ---";
open(my $fh, '<', $logfile) or die $!;
while (<$fh>) {
    print;
}
close($fh);

# Count lines in file
open($fh, '<', $logfile) or die $!;
my $lines = 0;
$lines++ while <$fh>;
close($fh);
say "\nTotal log entries: $lines";

# Append another entry
write_log("INFO", "Script completed");
say "Added final log entry.";
