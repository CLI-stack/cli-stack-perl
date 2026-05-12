#!/usr/bin/perl
# LESSON 59: Directory Operations
# How to list, create, and manage directories

use strict;
use warnings;
use feature 'say';

my $dir = "/tmp";   # directory we will inspect

# opendir/readdir - open a directory and read its entries
opendir(my $dh, $dir) or die "Cannot open dir $dir: $!";  # $dh = directory handle
my @all_entries = readdir($dh);   # readdir returns ALL entries including . and ..
closedir($dh);                    # close directory handle when done

say "All entries in $dir (first 10):";
say "  $_" for (sort @all_entries)[0..9];   # sort and show first 10

# Filter: only show regular FILES (not directories, not . or ..)
opendir($dh, $dir) or die $!;
my @files = grep { -f "$dir/$_" } readdir($dh);  # -f tests the full path
closedir($dh);

say "\nFiles only (first 5):";
say "  $_" for (sort @files)[0..4];   # show first 5 files sorted

# glob() - simpler pattern matching (like shell wildcards)
say "\nText files in /tmp:";
my @txt_files = glob("/tmp/*.txt");   # * matches any sequence of characters
if (@txt_files) {
    say "  $_" for @txt_files;
} else {
    say "  (none found)";
}

# Find our own test files
say "\nOur temp test files:";
my @perl_tmp = glob("/tmp/perl_*.{txt,log,csv}");  # {txt,log,csv} matches any of those extensions
say "  $_" for @perl_tmp;

# Create a directory with mkdir
my $new_dir = "/tmp/perl_test_dir";
unless (-d $new_dir) {                           # only create if it doesn't already exist
    mkdir $new_dir, 0755 or die "Cannot mkdir: $!";  # 0755 = octal permissions (rwxr-xr-x)
    say "\nCreated directory: $new_dir";
}

# Remove an empty directory with rmdir (fails if directory has contents)
rmdir $new_dir if -d $new_dir;    # only remove if it exists
say "Removed directory: $new_dir";
