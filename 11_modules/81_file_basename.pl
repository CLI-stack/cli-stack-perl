#!/usr/bin/perl
# LESSON 81: File::Basename and File::Spec

use strict;
use warnings;
use feature 'say';
use File::Basename qw(basename dirname fileparse);
use File::Spec;

# basename - get filename from path
my @paths = (
    "/home/user/documents/report.pdf",
    "/etc/nginx/nginx.conf",
    "relative/path/file.txt",
    "/just/a/directory/",
);

say "=== basename and dirname ===";
for my $path (@paths) {
    printf "Path    : %s\n", $path;
    printf "Basename: %s\n", basename($path);
    printf "Dirname : %s\n", dirname($path);

    # fileparse: returns (name, dir, suffix)
    my ($name, $dir, $suffix) = fileparse($path, qr/\.[^.]*/);
    printf "Name    : %s\n", $name;
    printf "Suffix  : %s\n", $suffix;
    say "-" x 40;
}

# basename with suffix stripping
say "Strip .txt: " . basename("file.txt", ".txt");
say "Strip .pl : " . basename("/path/script.pl", ".pl");

# File::Spec for portable path handling
say "\n=== File::Spec ===";
my $joined = File::Spec->catfile("/home", "user", "docs", "file.txt");
say "catfile: $joined";

my ($vol, $dir, $file) = File::Spec->splitpath("/home/user/file.txt");
say "volume: '$vol'";
say "dir   : '$dir'";
say "file  : '$file'";

say "is_absolute '/tmp' : " . (File::Spec->file_name_is_absolute("/tmp") ? "yes" : "no");
say "is_absolute 'rel'  : " . (File::Spec->file_name_is_absolute("rel")  ? "yes" : "no");

my $abs = File::Spec->rel2abs("relative/path.txt");
say "rel2abs: $abs";
