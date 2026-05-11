#!/usr/bin/perl
# LESSON 80: Data::Dumper - Debug Complex Structures

use strict;
use warnings;
use feature 'say';
use Data::Dumper;

# Data::Dumper is your best friend for debugging!
# It prints any data structure in a readable format.

my @array = (1, 2, 3, "hello", [4, 5], {a => 6});
my %hash  = (
    name    => "Alice",
    scores  => [95, 87, 92],
    address => { city => "KL", country => "Malaysia" },
);

# Default dump
print Dumper(\@array);
print Dumper(\%hash);

# Customize output
{
    local $Data::Dumper::Indent   = 1;   # compact format
    local $Data::Dumper::Sortkeys = 1;   # sort hash keys
    local $Data::Dumper::Terse    = 1;   # no variable name prefix
    print "\n--- Compact ---\n";
    print Dumper(\%hash);
}

# Name your variable in output
print Dumper({ name => "config", data => \%hash });
$Data::Dumper::Varname = "MYVAR";
print Dumper(\@array);
$Data::Dumper::Varname = "VAR";  # reset

# Use for logging/debugging a sub's arguments
sub process_data {
    my %args = @_;
    print "DEBUG args: " . Dumper(\%args) if $ENV{DEBUG};
    return "processed";
}

local $ENV{DEBUG} = 1;
process_data(name => "test", values => [1,2,3], flag => 1);

# Reconstruct the data from Dumper output (eval)
my $dumped = Dumper([10, 20, 30]);
my $reconstructed = eval $dumped;
say "\nReconstructed: " . join(", ", @$reconstructed);
