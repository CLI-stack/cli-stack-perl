#!/usr/bin/perl
# LESSON 62: Regex Substitution s///

use strict;
use warnings;
use feature 'say';

my $str = "Hello World from Perl World";

# s/pattern/replacement/ - replace FIRST match
(my $result = $str) =~ s/World/Earth/;
say "First replace : $result";

# /g flag - replace ALL matches globally
(my $all = $str) =~ s/World/Earth/g;
say "Global replace: $all";

# /i flag - case insensitive replacement
my $text = "The Cat sat on the cat mat";
(my $fixed = $text) =~ s/cat/dog/gi;
say "Case insensitive: $fixed";

# Replace with empty string (delete)
my $messy = "H e l l o   W o r l d";
(my $clean = $messy) =~ s/ //g;
say "Delete spaces: $clean";

# Remove non-digits
my $phone = "(555) 123-4567";
(my $digits_only = $phone) =~ s/\D//g;
say "Digits only: $digits_only";

# In-place modification (modifies the variable directly)
my $name = "john doe";
$name =~ s/\b(\w)/uc($1)/ge;   # /e evaluates replacement as code
say "Title case: $name";

# Replace using captured group
my $date = "2025-01-15";
$date =~ s/(\d{4})-(\d{2})-(\d{2})/$3\/$2\/$1/;
say "Date reformatted: $date";   # 15/01/2025

# tr/// - transliteration (character-by-character replace)
my $s = "Hello World";
(my $t = $s) =~ tr/a-z/A-Z/;   # uppercase all
say "tr uppercase: $t";

my $count_vowels = ($s =~ tr/aeiouAEIOU//);
say "Vowel count: $count_vowels";
