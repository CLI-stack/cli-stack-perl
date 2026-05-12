#!/usr/bin/perl
# LESSON 12: substr() - Extract and Replace Parts of Strings
# substr lets you read or change any part of a string by position

use strict;
use warnings;
use feature 'say';

my $str = "Hello, Perl World!";   # the source string we will work with

# substr(string, start_position, length)
say substr($str, 0, 5);    # start at position 0, take 5 chars  -> "Hello"
say substr($str, 7, 4);    # start at position 7, take 4 chars  -> "Perl"
say substr($str, -6);      # negative position = count from END -> "orld!" (last 6 chars)

say substr($str, -6, 5);   # negative start + length -> "World" (5 chars from position -6)

# Use substr on the LEFT side of = to REPLACE part of a string
my $s = "Hello World";
substr($s, 6, 5) = "Perl";  # replace 5 characters starting at position 6
say $s;                       # prints: Hello Perl

# 4-argument form: substr(string, offset, length, replacement)
my $s2 = "I like cats";
my $old = substr($s2, 7, 4, "dogs");  # replace "cats" with "dogs", returns old value
say "New: $s2";   # prints: I like dogs
say "Old: $old";  # prints: cats - substr returned the removed text

# Extract filename from a full path using rindex + substr
my $path     = "/home/user/documents/file.txt";
my $slash_at = rindex($path, "/");        # find position of LAST slash
my $filename = substr($path, $slash_at + 1);  # take everything after that slash
say "Filename: $filename";                # prints: file.txt
