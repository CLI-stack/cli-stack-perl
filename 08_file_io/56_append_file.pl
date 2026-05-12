#!/usr/bin/perl
# LESSON 56: Appending to Files
# '>>' mode adds content to the END of an existing file without erasing it

use strict;
use warnings;
use feature 'say';

my $logfile = "/tmp/perl_app.log";

# This subroutine appends one log entry to the log file
sub write_log {
    my ($level, $message) = @_;                               # get log level and message
    open(my $fh, '>>', $logfile) or die "Cannot open log: $!";  # '>>' = append mode
    my $timestamp = scalar localtime();                        # get current date/time as string
    print $fh "[$timestamp] [$level] $message\n";             # write formatted log line
    close($fh);                                               # close after each write
}

# Write several log entries one at a time
write_log("INFO",  "Application started");
write_log("DEBUG", "Loading configuration");
write_log("INFO",  "Server listening on port 8080");
write_log("WARN",  "High memory usage detected");
write_log("ERROR", "Database connection timeout");
write_log("INFO",  "Reconnecting to database...");

# Read back the complete log file
say "--- Log file contents ---";
open(my $fh, '<', $logfile) or die $!;
while (<$fh>) {
    print;   # $_ is set to each line; print prints it
}
close($fh);

# Count how many lines are in the file
open($fh, '<', $logfile) or die $!;
my $lines = 0;
$lines++ while <$fh>;    # increment for every line read
close($fh);
say "\nTotal log entries: $lines";

write_log("INFO", "Script completed");   # append one more entry
say "Added final log entry.";
