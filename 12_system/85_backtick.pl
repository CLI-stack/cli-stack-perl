#!/usr/bin/perl
# LESSON 85: Backticks and qx// - Capture Command Output
# Unlike system() which discards output, backticks CAPTURE it into a string

use strict;
use warnings;
use feature 'say';

# Backticks `` capture the stdout of a command into a string
my $date = `date`;     # run 'date' command and store its output in $date
chomp $date;           # remove the trailing newline that commands usually add
say "Date: $date";     # prints the current date

# qx// is identical to backticks but clearer when the command has special characters
my $hostname = qx(hostname);   # run hostname command
chomp $hostname;
say "Host: $hostname";

# Output of multi-line commands comes back as one big string
my $files = `ls /tmp | head -5`;   # first 5 files in /tmp
say "First 5 in /tmp:\n$files";    # \n separates our intro from the file list

# In LIST context, each line becomes a separate array element
my @df_lines = `df -h`;    # disk usage - one line per filesystem
chomp @df_lines;            # chomp works on arrays too
say "Disk usage:";
say "  $_" for @df_lines[0..2];   # print first 3 lines (header + 2 filesystems)

# Capture STDERR too with 2>&1 shell redirection
my $output = `ls /nonexistent 2>&1`;   # 2>&1 merges stderr into stdout
say "Error output: $output";            # prints the "No such file" error

# Check git branch if we're in a git repository
if (-d ".git") {
    my $branch = `git rev-parse --abbrev-ref HEAD 2>/dev/null`;  # 2>/dev/null suppresses errors
    chomp $branch;
    say "Git branch: $branch";
}

# Get current user
my $whoami = `whoami`;   # who is running this script?
chomp $whoami;
say "Running as: $whoami";

# SECURITY WARNING: NEVER use backticks with untrusted user input!
# This is vulnerable to command injection:
# my $file = get_user_input();
# my $output = `cat $file`;   # DANGEROUS - user could enter "file; rm -rf /"
# Use open() with a list for safe subprocess communication instead.
