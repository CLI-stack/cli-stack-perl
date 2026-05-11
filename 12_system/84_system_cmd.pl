#!/usr/bin/perl
# LESSON 84: Running System Commands

use strict;
use warnings;
use feature 'say';

# system() - run a command, wait for it to finish
# Returns exit code: 0 = success, non-zero = failure
say "=== system() ===";
my $ret = system("echo 'Hello from system()'");
say "Return code: $ret";

# Check if command succeeded
if (system("ls /tmp > /dev/null 2>&1") == 0) {
    say "/tmp exists and is listable";
}

# The exit code is in $? after system()
system("true");   # always succeeds
say "true exit: $?";

system("false");  # always fails
say "false exit: $?";

# Get the actual exit status
my $exit_status = $? >> 8;   # right-shift by 8

# system with a list (safer - avoids shell injection)
system("echo", "safe", "way", "to", "run", "commands");

# exec() - replace current process (no return)
# exec("ls", "-la");  # uncomment to test

# Practical: run a command and check
sub run_cmd {
    my @cmd = @_;
    say "Running: " . join(" ", @cmd);
    my $ret = system(@cmd);
    if ($ret != 0) {
        my $code = $? >> 8;
        warn "Command failed with exit code $code\n";
        return 0;
    }
    return 1;
}

run_cmd("date");
run_cmd("ls", "/tmp");
