#!/usr/bin/perl
# LESSON 87: Command-Line Arguments (@ARGV)

use strict;
use warnings;
use feature 'say';

# @ARGV contains all arguments passed to the script
# Run: perl 87_argv.pl hello world 42

say "Number of arguments: " . scalar(@ARGV);
say "Arguments: " . join(", ", @ARGV);

# Access individually
if (@ARGV) {
    say "First arg : $ARGV[0]";
    say "Last arg  : $ARGV[-1]";
}

# Process arguments
for my $i (0..$#ARGV) {
    say "  ARGV[$i] = '$ARGV[$i]'";
}

# Shift arguments (common pattern)
# if (@ARGV) {
#     my $filename = shift @ARGV;
#     my $option   = shift @ARGV // "default";
# }

# Simple flag processing
my %opts;
my @pos_args;

for my $arg (@ARGV) {
    if ($arg =~ /^--(\w+)=(.+)$/) {
        $opts{$1} = $2;          # --key=value
    } elsif ($arg =~ /^--(\w+)$/) {
        $opts{$1} = 1;           # --flag
    } elsif ($arg =~ /^-(\w)$/) {
        $opts{$1} = 1;           # -f
    } else {
        push @pos_args, $arg;    # positional
    }
}

say "\n=== Parsed args ===";
say "Flags/options:";
say "  $_ = $opts{$_}" for sort keys %opts;
say "Positional: " . join(", ", @pos_args);

say "\nTry running: perl $0 hello world --name=Alice --debug -v";

# $0 = script name
say "\nScript name: $0";
