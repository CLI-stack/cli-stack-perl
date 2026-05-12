#!/usr/bin/perl
# LESSON 11: Case Conversion
# Change strings between uppercase and lowercase

use strict;
use warnings;
use feature 'say';

my $str = "Hello World from Perl";  # mixed case string

say uc($str);        # uc() = uppercase ALL characters: HELLO WORLD FROM PERL
say lc($str);        # lc() = lowercase ALL characters: hello world from perl
say ucfirst($str);   # ucfirst() = uppercase ONLY the very first character
say lcfirst($str);   # lcfirst() = lowercase ONLY the very first character

# Practical use: case-insensitive comparison
my $input = "YES";              # user might type in any case
if (lc($input) eq "yes") {     # lc() converts input to lowercase before comparing
    say "User agreed!";         # this matches whether user typed YES, Yes, yes, yEs etc
}

# Title case: uppercase the first letter of EACH word
my $title = "the quick brown fox";  # all lowercase
$title =~ s/\b(\w)/uc($1)/ge;       # regex: \b=word boundary, \w=word char, /e=eval replacement
say "Title case: $title";            # prints: The Quick Brown Fox

# Check if a string is all uppercase
my $test = "PERL";
if ($test eq uc($test)) {          # compare string to its own uppercased version
    say "'$test' is all uppercase"; # if equal, it was already all uppercase
}
