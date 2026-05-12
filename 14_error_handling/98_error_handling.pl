#!/usr/bin/perl
# LESSON 98: Structured Error Handling Patterns
# Different strategies for reporting and recovering from errors in Perl

use strict;
use warnings;
use feature 'say';

# PATTERN 1: "or die" - the most common Perl idiom
# open(my $fh, '<', $file) or die "Cannot open: $!";
# Simple, readable, and stops execution immediately on failure

# PATTERN 2: Return undef on failure, use // to provide a default
sub read_config {
    my $path = shift;
    open(my $fh, '<', $path) or return undef;   # return undef instead of dying
    my %cfg;
    while (<$fh>) {
        chomp;
        $cfg{$1} = $2 if /^(\w+)\s*=\s*(.+)$/;   # parse key=value lines
    }
    close $fh;
    return \%cfg;   # return hash ref on success
}

my $cfg = read_config("/nonexistent") // {};   # // replaces undef with empty hash
say "Config keys: " . scalar(keys %$cfg);      # 0 keys - safe, no crash

# PATTERN 3: Return (value, error) tuple - like Go language style
# Caller must always check the second return value
sub safe_divide {
    my ($a, $b) = @_;
    return (undef, "Division by zero") if $b == 0;   # signal error as second return
    return ($a / $b, undef);                          # success: value, no error
}

my ($result, $err) = safe_divide(10, 3);   # call and unpack both return values
if (defined $err) { say "Error: $err"       }
else              { printf "10/3 = %.4f\n", $result }

($result, $err) = safe_divide(10, 0);
if (defined $err) { say "Error: $err" }   # prints: Error: Division by zero

# PATTERN 4: Die with a structured hash ref (structured exceptions)
# Caller can inspect the type of error and handle different types differently
sub risky_operation {
    my $input = shift;
    unless (defined $input && $input =~ /^\d+$/) {
        die {                               # die with a HASH REFERENCE
            type  => "ValidationError",    # type allows catching specific errors
            msg   => "Input must be a number",
            input => $input,
        };
    }
    return $input * 2;
}

for my $test (42, "hello", undef) {
    my $r = eval { risky_operation($test) };   # catch any die
    if (my $e = $@) {
        if (ref $e eq 'HASH' && $e->{type} eq 'ValidationError') {
            # check the type field to handle this specific error
            say "Validation: $e->{msg} (got: " . ($e->{input} // "undef") . ")";
        } else {
            say "Unknown error: $e";   # re-throw or handle unknown errors
        }
    } else {
        say "Result: $r";   # no error - print the result
    }
}
