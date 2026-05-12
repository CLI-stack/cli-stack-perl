#!/usr/bin/perl
# LESSON 88: Exit Codes and Signal Handling
# How to end a script properly and react to OS signals

use strict;
use warnings;
use feature 'say';

say "Script starting...";

# exit(N) terminates the script with exit code N
# Convention: 0 = success, any other number = some kind of failure
# Other programs check this code to know if your script succeeded

my $config_ok = 1;   # simulate a configuration check result

unless ($config_ok) {
    say STDERR "ERROR: Configuration is invalid";   # errors go to STDERR
    exit(1);                                          # exit immediately with failure code
}
say "Config is OK";

# %SIG is a special hash mapping signal names to handler subroutines
# When the OS sends a signal, Perl calls the corresponding handler
$SIG{INT}  = sub { say "\nCaught Ctrl+C (SIGINT)! Cleaning up..."; exit(0); };
# SIGINT is sent when user presses Ctrl+C

$SIG{TERM} = sub { say "\nCaught TERM signal. Shutting down."; exit(0); };
# SIGTERM is sent by kill command or system shutdown

$SIG{HUP}  = sub { say "Caught HUP signal - would reload config here."; };
# SIGHUP is often used to tell a daemon to reload its configuration

say "Signal handlers installed.";

# END block: code in END{} runs ALWAYS when the script exits, no matter how it exits
# Like "finally" in other languages, or a destructor
END {
    say "END block executing: cleaning up before script ends";
    # Close files, release resources, log completion, etc.
}

# Simulate doing some work
for my $i (1..3) {
    say "Working... step $i";
    select(undef, undef, undef, 0.3);   # sleep for 0.3 seconds (portable sleep)
}

say "All work done!";
exit(0);   # explicit successful exit (0 = success)
