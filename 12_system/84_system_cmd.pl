#!/usr/bin/perl
# LESSON 84: Running System Commands with system()
# How to run shell commands from Perl and check if they succeeded

use strict;
use warnings;
use feature 'say';

# system() runs a command in a child process and waits for it to finish
# Returns 0 on SUCCESS, non-zero on FAILURE (opposite of most Perl functions!)
say "=== system() ===";
my $ret = system("echo 'Hello from system()'");  # runs echo command
say "Return code: $ret";   # 0 means success

# Check success or failure
if (system("ls /tmp > /dev/null 2>&1") == 0) {   # redirect stdout and stderr to /dev/null
    say "/tmp exists and is listable";              # 0 = success
}

# $? holds the raw exit status; right-shift by 8 to get the real exit code
system("true");   # 'true' is a command that always succeeds
say "true exit status: " . ($? >> 8);   # 0 = success

system("false");  # 'false' is a command that always fails
say "false exit status: " . ($? >> 8);  # 1 = failure

# Safe form: pass command as a LIST (avoids shell injection attacks)
# When passed as a list, Perl does NOT use the shell - safer for user input
system("echo", "safe", "way", "to", "run", "commands");

# Wrapper sub for running commands with clear success/failure reporting
sub run_cmd {
    my @cmd = @_;                                   # accept any number of arguments
    say "Running: " . join(" ", @cmd);              # show what we're running
    my $ret = system(@cmd);                         # run as a list (safe)
    if ($ret != 0) {
        my $code = $? >> 8;                         # extract real exit code
        warn "Command failed with exit code $code\n";
        return 0;   # return false = failure
    }
    return 1;       # return true = success
}

run_cmd("date");          # show current date
run_cmd("ls", "/tmp");    # list /tmp safely
