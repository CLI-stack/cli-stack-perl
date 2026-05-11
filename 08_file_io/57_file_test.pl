#!/usr/bin/perl
# LESSON 57: File Test Operators

use strict;
use warnings;
use feature 'say';

my $file = "/tmp/perl_output.txt";
my $dir  = "/tmp";

# File existence and type
say "File tests for: $file";
say "  -e exists       : " . (-e $file ? "yes" : "no");
say "  -f is plain file: " . (-f $file ? "yes" : "no");
say "  -d is directory : " . (-d $file ? "yes" : "no");
say "  -r readable     : " . (-r $file ? "yes" : "no");
say "  -w writable     : " . (-w $file ? "yes" : "no");
say "  -x executable   : " . (-x $file ? "yes" : "no");
say "  -s size (bytes) : " . (-s $file // "N/A");
say "  -z zero size    : " . (-z $file ? "yes" : "no");

say "\nDirectory tests for: $dir";
say "  -d is directory: " . (-d $dir ? "yes" : "no");
say "  -r readable    : " . (-r $dir ? "yes" : "no");

# Practical: safe file operations
sub safe_read {
    my $path = shift;
    unless (-e $path) { say "File not found: $path"; return; }
    unless (-r $path) { say "Cannot read: $path";    return; }
    unless (-f $path) { say "Not a file: $path";     return; }

    open(my $fh, '<', $path) or die "Open failed: $!";
    my @lines = <$fh>;
    close($fh);
    return @lines;
}

my @content = safe_read($file);
say "\nRead " . scalar(@content) . " lines from $file";

# File age comparison
say "\n$file is " . (-M $file) . " days old" if -e $file;
say "$file last accessed " . (-A $file) . " days ago" if -e $file;
