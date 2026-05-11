#!/usr/bin/perl
# LESSON 60: Rename, Copy, Delete Files

use strict;
use warnings;
use feature 'say';
use File::Copy qw(copy move);

my $src  = "/tmp/perl_output.txt";
my $dest = "/tmp/perl_output_backup.txt";

# Check source exists
unless (-e $src) {
    # Create it if it doesn't exist yet
    open(my $fh, '>', $src) or die $!;
    print $fh "backup test content\n";
    close($fh);
}

# copy - copies a file
if (copy($src, $dest)) {
    say "Copied $src => $dest";
} else {
    say "Copy failed: $!";
}

# Verify both exist
say "src  exists: " . (-e $src  ? "yes" : "no");
say "dest exists: " . (-e $dest ? "yes" : "no");

# rename - built-in (only works on same filesystem)
my $renamed = "/tmp/perl_output_renamed.txt";
rename($dest, $renamed) or die "Rename failed: $!";
say "Renamed to $renamed";

# move (from File::Copy) - works across filesystems
my $moved = "/tmp/perl_moved_file.txt";
move($renamed, $moved) or die "Move failed: $!";
say "Moved to $moved";

# unlink - delete a file
if (unlink $moved) {
    say "Deleted $moved";
} else {
    say "Delete failed: $!";
}

# Delete multiple files
my @to_delete = glob("/tmp/perl_*.log");
my $del_count = unlink @to_delete;
say "Deleted $del_count log files";
