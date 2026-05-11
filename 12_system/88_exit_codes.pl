#!/usr/bin/perl
# LESSON 88: Exit Codes and Signal Handling

use strict;
use warnings;
use feature 'say';

# exit() - terminate the script with an exit code
# 0 = success, non-zero = failure (convention)
say "Script starting...";

# Check a condition and exit with appropriate code
my $config_ok = 1;   # simulate config check

unless ($config_ok) {
    say STDERR "ERROR: Configuration is invalid";
    exit(1);   # exit with failure code
}
say "Config OK";

# Common exit codes:
# 0  = success
# 1  = general error
# 2  = misuse of shell command
# 126 = command cannot execute
# 127 = command not found
# 128+n = fatal signal n

# die() exits with code 1 (unless in eval block)
# use die for errors, exit for normal termination

# Trap signals with %SIG
$SIG{INT}  = sub { say "\nCaught Ctrl+C! Cleaning up..."; exit(0); };
$SIG{TERM} = sub { say "\nCaught TERM signal. Exiting.";  exit(0); };
$SIG{HUP}  = sub { say "Caught HUP - reloading config..."; };

say "Signal handlers installed.";
say "(Press Ctrl+C to test INT handler, or let it finish)";

# END block - runs on any exit (like a destructor/finally)
END {
    say "END block: cleanup before exit";
}

# Simulate work
for my $i (1..3) {
    say "Working... step $i";
    select(undef, undef, undef, 0.5);   # sleep 0.5 seconds
}

say "Done!";
exit(0);   # explicit success exit
