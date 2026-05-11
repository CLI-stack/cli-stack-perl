#!/usr/bin/perl
# LESSON 16: String Trimming and Padding (no built-in trim in Perl)

use strict;
use warnings;
use feature 'say';

# Perl has no built-in trim() - use regex
sub trim {
    my $s = shift;
    $s =~ s/^\s+|\s+$//g;   # remove leading and trailing whitespace
    return $s;
}

sub ltrim { my $s = shift; $s =~ s/^\s+//; return $s; }
sub rtrim { my $s = shift; $s =~ s/\s+$//; return $s; }

my $messy = "   Hello World   ";
say "Original : '$messy'";
say "Trimmed  : '" . trim($messy)  . "'";
say "Left trim: '" . ltrim($messy) . "'";
say "Right trim:'" . rtrim($messy) . "'";

# Padding with sprintf
my $word = "Perl";
printf "Right padded : '%-10s'\n", $word;   # 'Perl      '
printf "Left padded  : '%10s'\n",  $word;   # '      Perl'
printf "Zero padded  : '%010d'\n", 42;      # '0000000042'

# Center a string manually
sub center {
    my ($str, $width) = @_;
    my $pad = ($width - length($str)) / 2;
    return " " x int($pad) . $str . " " x int($pad);
}

say "=" x 30;
say center("Perl Lessons", 30);
say "=" x 30;
