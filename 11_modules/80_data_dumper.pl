#!/usr/bin/perl
# LESSON 80: Data::Dumper - Your Best Debugging Tool
# Prints any data structure in a human-readable format

use strict;
use warnings;
use feature 'say';
use Data::Dumper;   # always available in Perl - no CPAN install needed

# Data::Dumper can print ANY Perl data structure - invaluable for debugging

my @array = (1, 2, 3, "hello", [4, 5], {a => 6});   # mixed nested array
my %hash  = (
    name   => "Alice",
    scores => [95, 87, 92],                          # array ref as hash value
    address => { city => "KL", country => "Malaysia" },  # nested hash ref
);

# Dumper(\var) - always pass a REFERENCE to the variable you want to dump
print Dumper(\@array);   # prints $VAR1 = [ ... ]; structure
print Dumper(\%hash);    # prints $VAR1 = { ... }; structure

# Customize the output format
{
    local $Data::Dumper::Indent   = 1;   # compact indentation (default is 2 = verbose)
    local $Data::Dumper::Sortkeys = 1;   # sort hash keys alphabetically
    local $Data::Dumper::Terse    = 1;   # suppress $VAR1 = prefix
    print "\n--- Compact output ---\n";
    print Dumper(\%hash);
}   # 'local' means settings revert to original after this block

# Change the variable name shown in output
$Data::Dumper::Varname = "CONFIG";   # shows $CONFIG1 instead of $VAR1
print Dumper(\%hash);
$Data::Dumper::Varname = "VAR";      # reset to default

# Use for debugging: print what a sub receives
sub process_data {
    my %args = @_;
    print "DEBUG args: " . Dumper(\%args) if $ENV{DEBUG};  # only print if DEBUG env var set
    return "processed";
}

local $ENV{DEBUG} = 1;              # set DEBUG for this block
process_data(name => "test", values => [1,2,3], flag => 1);   # will print the args

# Reconstruct data from Dumper output using eval
my $dumped       = Dumper([10, 20, 30]);        # get the Dumper string
my $reconstructed = eval $dumped;               # eval parses and executes the string as Perl code
say "\nReconstructed: " . join(", ", @$reconstructed);  # 10, 20, 30
