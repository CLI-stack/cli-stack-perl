#!/usr/bin/perl
# LESSON 57: File Test Operators
# Special operators (-e, -f, -d etc.) that check properties of files and directories

use strict;
use warnings;
use feature 'say';

my $file = "/tmp/perl_output.txt";   # a file we created in earlier lessons
my $dir  = "/tmp";                    # a directory to test

# File test operators return true/false
say "File tests for: $file";
say "  -e exists        : " . (-e $file ? "yes" : "no");  # -e: does the path exist at all?
say "  -f is plain file : " . (-f $file ? "yes" : "no");  # -f: is it a regular file?
say "  -d is directory  : " . (-d $file ? "yes" : "no");  # -d: is it a directory?
say "  -r readable      : " . (-r $file ? "yes" : "no");  # -r: can we read it?
say "  -w writable      : " . (-w $file ? "yes" : "no");  # -w: can we write to it?
say "  -x executable    : " . (-x $file ? "yes" : "no");  # -x: is it executable?
say "  -s size (bytes)  : " . (-s $file // "N/A");        # -s: file size in bytes (undef if missing)
say "  -z zero size     : " . (-z $file ? "yes" : "no");  # -z: is the file empty (zero bytes)?

say "\nDirectory tests for: $dir";
say "  -d is directory  : " . (-d $dir ? "yes" : "no");   # /tmp should be a directory
say "  -r readable      : " . (-r $dir ? "yes" : "no");   # can we list its contents?

# Safe file reading: check all conditions BEFORE opening
sub safe_read {
    my $path = shift;
    unless (-e $path) { say "File not found: $path"; return; }  # must exist
    unless (-r $path) { say "Cannot read: $path";    return; }  # must be readable
    unless (-f $path) { say "Not a file: $path";     return; }  # must be a regular file

    open(my $fh, '<', $path) or die "Open failed: $!";
    my @lines = <$fh>;   # read all lines
    close($fh);
    return @lines;
}

my @content = safe_read($file);
say "\nRead " . scalar(@content) . " lines from $file";

# File age operators (-M, -A, -C) return time in DAYS since event
say "\n$file is " . (-M $file) . " days old"              if -e $file;  # -M: days since modified
say "$file last accessed " . (-A $file) . " days ago"    if -e $file;  # -A: days since accessed
