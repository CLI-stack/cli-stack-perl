#!/usr/bin/perl
# LESSON 62: Regex Substitution s///
# s/pattern/replacement/ finds a pattern and replaces it with new text

use strict;
use warnings;
use feature 'say';

my $str = "Hello World from Perl World";

# s/find/replace/ - replaces the FIRST match only
(my $result = $str) =~ s/World/Earth/;  # (my $copy = $orig) creates a copy first
say "First replace : $result";           # "Hello Earth from Perl World" - only first changed

# /g flag = global - replace ALL matches in the string
(my $all = $str) =~ s/World/Earth/g;
say "Global replace: $all";              # both "World" occurrences replaced

# /i flag = case-insensitive matching
my $text = "The Cat sat on the cat mat";
(my $fixed = $text) =~ s/cat/dog/gi;    # /gi = global AND case-insensitive
say "Case insensitive: $fixed";          # ALL cat/Cat replaced with dog

# Replace with empty string to DELETE the matched text
my $messy = "H e l l o   W o r l d";
(my $clean = $messy) =~ s/ //g;         # replace every space with nothing
say "Delete spaces: $clean";             # "HelloWorld"

# Remove all non-digit characters from a phone number
my $phone       = "(555) 123-4567";
(my $digits_only = $phone) =~ s/\D//g;  # \D = any non-digit character
say "Digits only: $digits_only";          # 5551234567

# /e flag = evaluate replacement as Perl code
my $name = "john doe";
$name =~ s/\b(\w)/uc($1)/ge;   # \b = word boundary, \w = word char, $1 = captured char
# for each word-starting character, replace it with uc() of itself
say "Title case: $name";         # John Doe

# Rearrange a date format using capture groups
my $date = "2025-01-15";
$date =~ s/(\d{4})-(\d{2})-(\d{2})/$3\/$2\/$1/;  # $1=year $2=month $3=day
say "Date reformatted: $date";                      # 15/01/2025

# tr/// - transliterate: replace each character one-for-one
my $s = "Hello World";
(my $t = $s) =~ tr/a-z/A-Z/;                    # replace every lowercase with its uppercase
say "tr uppercase: $t";                           # HELLO WORLD
my $vowel_count = ($s =~ tr/aeiouAEIOU//);       # count without replacement
say "Vowel count: $vowel_count";                  # 3
