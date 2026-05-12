#!/usr/bin/perl
# LESSON 82: Cwd - Current Working Directory
# Find out where your script is and navigate the filesystem

use strict;
use warnings;
use feature 'say';
use Cwd qw(cwd getcwd abs_path);   # import directory functions
use File::Basename 'dirname';       # import dirname for path manipulation

# cwd() and getcwd() both return the current working directory
my $dir = cwd();
say "Current dir (cwd)    : $dir";
say "Current dir (getcwd) : " . getcwd();   # identical to cwd()

# abs_path() resolves symlinks and relative paths to their real absolute path
say "\nabs_path examples:";
say abs_path(".");    # absolute path of current directory
say abs_path("..");   # absolute path of parent directory

# Get the directory where THIS script is located
# $0 = the path to the currently running script (set by Perl automatically)
my $script_dir = dirname(abs_path($0));   # abs_path($0) = full path; dirname = remove filename
say "\nThis script is in: $script_dir";

# chdir() changes the current directory
say "\nOriginal dir: " . cwd();

chdir("/tmp") or die "Cannot chdir to /tmp: $!";   # change to /tmp
say "After chdir : " . cwd();                        # now in /tmp

my @files = glob("perl_*");                          # list perl_* files in /tmp
say "Perl test files in /tmp: " . scalar(@files);

chdir($dir) or die "Cannot return to $dir: $!";     # go back to original directory
say "After restore: " . cwd();                       # back where we started

# Safe temporary directory change using eval for cleanup
my $saved = cwd();   # remember where we are
eval {
    chdir("/tmp") or die "chdir failed: $!";   # die inside eval is caught
    say "\nTemporarily in: " . cwd();
    # ... do work in /tmp ...
};
chdir($saved);        # ALWAYS restore, even if eval failed
warn $@ if $@;        # report any error that occurred in eval
say "Safely restored to: " . cwd();
