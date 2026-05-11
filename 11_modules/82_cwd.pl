#!/usr/bin/perl
# LESSON 82: Cwd - Current Working Directory

use strict;
use warnings;
use feature 'say';
use Cwd qw(cwd getcwd abs_path);

# Get current directory
my $dir = cwd();
say "Current dir (cwd)    : $dir";
say "Current dir (getcwd) : " . getcwd();

# abs_path - resolve symlinks and relative paths
say "\nabs_path examples:";
say abs_path(".");
say abs_path("..");

# Practical: get script's own directory
my $script_dir = abs_path($0);   # $0 = path to current script
use File::Basename 'dirname';
$script_dir = dirname(abs_path($0));
say "\nThis script is in: $script_dir";

# Change directory temporarily
say "\nOriginal dir: " . cwd();

{
    # Use local scope for temporary chdir
    chdir("/tmp") or die "Cannot chdir to /tmp: $!";
    say "Inside block: " . cwd();

    # Do work in /tmp...
    my @files = glob("perl_*");
    say "Perl test files in /tmp: " . scalar(@files);
}

# After the block, we need to restore manually
chdir($dir) or die "Cannot return: $!";
say "After restore: " . cwd();

# Better: save and restore with eval block
my $saved = cwd();
eval {
    chdir("/tmp") or die "chdir failed: $!";
    say "Working in: " . cwd();
    # ... do work
};
chdir($saved);
warn $@ if $@;
say "Restored to: " . cwd();
