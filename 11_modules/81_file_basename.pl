#!/usr/bin/perl
# LESSON 81: File::Basename and File::Spec
# Tools for splitting file paths into their components

use strict;
use warnings;
use feature 'say';
use File::Basename qw(basename dirname fileparse);  # path component tools
use File::Spec;                                      # portable path operations

my @paths = (
    "/home/user/documents/report.pdf",
    "/etc/nginx/nginx.conf",
    "relative/path/file.txt",
    "/just/a/directory/",
);

say "=== basename and dirname ===";
for my $path (@paths) {
    printf "Path    : %s\n", $path;
    printf "Basename: %s\n", basename($path);          # just the filename (last part)
    printf "Dirname : %s\n", dirname($path);           # everything except the filename

    # fileparse returns (name_without_suffix, directory, suffix)
    my ($name, $dir, $suffix) = fileparse($path, qr/\.[^.]*/);  # qr/\.[^.]*/ = any extension
    printf "Name    : %s\n", $name;                    # filename without extension
    printf "Suffix  : %s\n", $suffix;                  # the extension (e.g., ".pdf")
    say "-" x 40;
}

# basename can strip a specific suffix
say "Strip .txt: " . basename("file.txt", ".txt");     # "file" (extension removed)
say "Strip .pl : " . basename("/path/script.pl", ".pl");  # "script"

# File::Spec - portable path building (works on Windows, Linux, Mac)
say "\n=== File::Spec ===";
my $joined = File::Spec->catfile("/home", "user", "docs", "file.txt");  # join path components
say "catfile: $joined";   # /home/user/docs/file.txt

# Split a path back into components
my ($vol, $dir2, $file) = File::Spec->splitpath("/home/user/file.txt");
say "volume: '$vol'";    # empty on Linux (used on Windows for C:)
say "dir   : '$dir2'";  # /home/user/
say "file  : '$file'";  # file.txt

# Check if a path is absolute (starts from root) or relative
say "is_absolute '/tmp'  : " . (File::Spec->file_name_is_absolute("/tmp") ? "yes" : "no");
say "is_absolute 'rel/p' : " . (File::Spec->file_name_is_absolute("rel/p") ? "yes" : "no");

# Convert relative path to absolute using current directory
my $abs = File::Spec->rel2abs("relative/path.txt");   # prepends current directory
say "rel2abs: $abs";
