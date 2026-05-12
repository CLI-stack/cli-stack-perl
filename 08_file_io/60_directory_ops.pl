#!/usr/bin/perl
# LESSON 60: Rename, Copy, and Delete Files
# How to manage files on the filesystem using Perl

use strict;
use warnings;
use feature 'say';
use File::Copy qw(copy move);   # import copy and move from File::Copy module

my $src  = "/tmp/perl_output.txt";        # source file
my $dest = "/tmp/perl_output_backup.txt"; # destination for copy

# Make sure the source file exists - create it if needed
unless (-e $src) {
    open(my $fh, '>', $src) or die $!;
    print $fh "backup test content\n";    # write some content
    close($fh);
}

# copy(source, destination) - copies a file, leaving original intact
if (copy($src, $dest)) {
    say "Copied $src => $dest";   # copy returns 1 on success
} else {
    say "Copy failed: $!";        # $! holds the error reason
}

say "src  exists: " . (-e $src  ? "yes" : "no");   # original still exists
say "dest exists: " . (-e $dest ? "yes" : "no");   # copy also exists

# rename(old, new) - built-in Perl rename (works on same filesystem)
my $renamed = "/tmp/perl_output_renamed.txt";
rename($dest, $renamed) or die "Rename failed: $!";   # moves/renames the file
say "Renamed to $renamed";

# move(source, destination) - from File::Copy, works across filesystems
my $moved = "/tmp/perl_moved_file.txt";
move($renamed, $moved) or die "Move failed: $!";   # moves and removes original
say "Moved to $moved";

# unlink(file) - delete a single file (like rm in shell)
if (unlink $moved) {
    say "Deleted $moved";      # unlink returns 1 on success
} else {
    say "Delete failed: $!";
}

# unlink can delete MULTIPLE files at once
my @to_delete = glob("/tmp/perl_*.log");   # find matching files
my $del_count  = unlink @to_delete;        # delete all; returns count deleted
say "Deleted $del_count log files";
