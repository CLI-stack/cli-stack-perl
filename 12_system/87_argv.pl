#!/usr/bin/perl
# LESSON 87: Command-Line Arguments with @ARGV
# @ARGV holds arguments passed to the script on the command line
# Try running: perl 87_argv.pl hello world --name=Alice --debug

use strict;
use warnings;
use feature 'say';

# @ARGV is automatically filled with command-line arguments
say "Number of arguments: " . scalar(@ARGV);     # how many args were passed
say "Arguments: " . join(", ", @ARGV);           # all args as comma-separated list

# Access individual arguments by index
if (@ARGV) {
    say "First arg : $ARGV[0]";    # first argument passed
    say "Last arg  : $ARGV[-1]";   # last argument (-1 = last element)
}

# Show each argument with its index
for my $i (0..$#ARGV) {
    say "  ARGV[$i] = '$ARGV[$i]'";
}

# Simple manual option parsing (for real apps use Getopt::Long module)
my %opts;       # will hold --key=value or --flag options
my @pos_args;   # will hold positional (non-option) arguments

for my $arg (@ARGV) {
    if ($arg =~ /^--(\w+)=(.+)$/) {    # --key=value format
        $opts{$1} = $2;                 # $1 = key, $2 = value
    } elsif ($arg =~ /^--(\w+)$/) {    # --flag format (boolean flag)
        $opts{$1} = 1;                  # mark as true
    } elsif ($arg =~ /^-(\w)$/) {      # -f short flag format
        $opts{$1} = 1;
    } else {
        push @pos_args, $arg;           # anything else is a positional argument
    }
}

say "\n=== Parsed arguments ===";
say "Flags/options:";
say "  $_ = $opts{$_}" for sort keys %opts;   # print all parsed options
say "Positional args: " . join(", ", @pos_args);

say "\nTry running: perl $0 hello world --name=Alice --debug -v";
# $0 = the name/path of the currently running script (set by Perl)
say "Script name: $0";
