#!/usr/bin/perl
# LESSON 98: Structured Error Handling Patterns

use strict;
use warnings;
use feature 'say';

# Pattern 1: or die (most common in Perl)
# open(my $fh, '<', $file) or die "Cannot open: $!";

# Pattern 2: Return undef on failure, check with //
sub read_config {
    my $path = shift;
    open(my $fh, '<', $path) or return undef;
    my %cfg;
    while (<$fh>) {
        chomp;
        $cfg{$1} = $2 if /^(\w+)\s*=\s*(.+)$/;
    }
    close $fh;
    return \%cfg;
}

my $cfg = read_config("/nonexistent") // {};
say "Config keys: " . scalar(keys %$cfg);

# Pattern 3: Return (value, error) tuple
sub safe_divide {
    my ($a, $b) = @_;
    return (undef, "Division by zero") if $b == 0;
    return ($a / $b, undef);
}

my ($result, $err) = safe_divide(10, 3);
if (defined $err) { say "Error: $err"      }
else              { say "10/3 = $result" }

($result, $err) = safe_divide(10, 0);
if (defined $err) { say "Error: $err"      }
else              { say "10/0 = $result" }

# Pattern 4: Exception objects via die with a hashref
sub risky_operation {
    my $input = shift;
    unless (defined $input && $input =~ /^\d+$/) {
        die { type => "ValidationError", msg => "Input must be a number", input => $input };
    }
    return $input * 2;
}

for my $test (42, "hello", undef) {
    my $r = eval { risky_operation($test) };
    if (my $e = $@) {
        if (ref $e eq 'HASH' && $e->{type} eq 'ValidationError') {
            say "Validation failed: $e->{msg} (got: " . ($e->{input}//"undef") . ")";
        } else {
            say "Unknown error: $e";
        }
    } else {
        say "Result: $r";
    }
}
