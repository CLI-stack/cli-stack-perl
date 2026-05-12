#!/usr/bin/perl
# LESSON 96: die and warn - Basic Error Handling
# How to signal errors and warnings in Perl

use strict;
use warnings;
use feature 'say';
use Carp qw(carp croak confess cluck);   # better error reporting (introduced here)

# warn() - prints a warning message to STDERR but continues execution
warn "This is a warning - script keeps running\n";   # \n prevents "at file line N" being appended
say "Script continued after warn";   # this DOES print - warn doesn't stop the script

# die() - prints an error to STDERR and TERMINATES the script (exits with code 1)
# Uncomment to test: die "This would stop the script\n";

# $! is the OS error variable - set when a system call fails (file open, etc.)
# open(my $fh, '<', '/nonexistent') or die "Cannot open: $!";
# The $! gives a human-readable OS error like "No such file or directory"

# Good practice: validate arguments in subroutines
sub divide {
    my ($a, $b) = @_;
    die "Division by zero!\n" if $b == 0;   # die with \n prevents "at file line N" suffix
    return $a / $b;
}

# eval {} catches die() - prevents it from killing the script
# $@ holds the error message after eval (empty string if no error)
my $result = eval { divide(10, 2) };   # try this code
if ($@) {
    say "Error: $@";    # print error if die was called
} else {
    say "10 / 2 = $result";   # print result if successful
}

$result = eval { divide(10, 0) };   # this will die inside eval
if ($@) {
    chomp(my $err = $@);   # remove trailing newline from error message
    say "Caught error: $err";
}

# Cascading errors: one sub calls another and handles failures
sub open_file {
    my $path = shift;
    open(my $fh, '<', $path) or die "open_file('$path') failed: $!\n";
    return $fh;
}

sub process_file {
    my $path = shift;
    my $fh   = eval { open_file($path) };   # catch any die from open_file
    if ($@) {
        warn "process_file: $@";   # report but don't die - return undef instead
        return undef;
    }
    return "OK";
}

my $r = process_file("/nonexistent/file.txt");   # will fail gracefully
say "Result: " . (defined $r ? $r : "failed");  # prints: failed
