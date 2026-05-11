#!/usr/bin/perl
# LESSON 59: Directory Operations

use strict;
use warnings;
use feature 'say';

# List files in a directory using opendir/readdir
my $dir = "/tmp";

opendir(my $dh, $dir) or die "Cannot open dir $dir: $!";
my @all_entries = readdir($dh);
closedir($dh);

say "All entries in $dir (first 10):";
say "  $_" for (sort @all_entries)[0..9];

# Filter: only files (not . and ..)
opendir($dh, $dir) or die $!;
my @files = grep { -f "$dir/$_" } readdir($dh);
closedir($dh);

say "\nFiles only (first 5):";
say "  $_" for (sort @files)[0..4];

# Glob - simpler way to match files by pattern
say "\nText files in /tmp:";
my @txt_files = glob("/tmp/*.txt");
if (@txt_files) {
    say "  $_" for @txt_files;
} else {
    say "  (none found)";
}

# Get Perl files we just created
say "\nOur temp test files:";
my @perl_tmp = glob("/tmp/perl_*.{txt,log,csv}");
say "  $_" for @perl_tmp;

# Create and check a directory
my $new_dir = "/tmp/perl_test_dir";
unless (-d $new_dir) {
    mkdir $new_dir, 0755 or die "Cannot mkdir: $!";
    say "\nCreated directory: $new_dir";
}

# Remove the dir (must be empty)
rmdir $new_dir if -d $new_dir;
say "Removed directory: $new_dir";
