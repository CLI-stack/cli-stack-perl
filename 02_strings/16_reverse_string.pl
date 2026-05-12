#!/usr/bin/perl
# LESSON 16: String Trimming and Padding
# Perl has no built-in trim() so we use regex to remove unwanted whitespace

use strict;
use warnings;
use feature 'say';

# Perl has no trim() built-in so we write our own using regex substitution
sub trim {
    my $s = shift;              # get the first argument
    $s =~ s/^\s+|\s+$//g;      # remove leading (^\s+) AND trailing (\s+$) whitespace
                                # | means OR; /g means apply globally (both sides)
    return $s;                  # return the cleaned string
}

sub ltrim {                     # left trim - remove only leading whitespace
    my $s = shift;
    $s =~ s/^\s+//;            # ^\s+ matches whitespace at the START of string
    return $s;
}

sub rtrim {                     # right trim - remove only trailing whitespace
    my $s = shift;
    $s =~ s/\s+$//;            # \s+$ matches whitespace at the END of string
    return $s;
}

my $messy = "   Hello World   ";        # string with spaces on both sides
say "Original   : '$messy'";
say "Trimmed    : '" . trim($messy)  . "'";   # removes both sides
say "Left trim  : '" . ltrim($messy) . "'";   # removes only left spaces
say "Right trim : '" . rtrim($messy) . "'";   # removes only right spaces

# Padding with sprintf (add spaces to reach a fixed width)
my $word = "Perl";
printf "Right padded : '%-10s'\n", $word;   # %-10s = left-align in 10-char field (pads RIGHT)
printf "Left padded  : '%10s'\n",  $word;   # %10s  = right-align in 10-char field (pads LEFT)
printf "Zero padded  : '%010d'\n", 42;      # %010d = integer padded with zeros to 10 digits

sub center {                                # center a string within a given width
    my ($str, $width) = @_;                 # get string and desired total width
    my $pad = ($width - length($str)) / 2; # calculate how much padding needed on each side
    return " " x int($pad) . $str . " " x int($pad);  # build padded string
}

say "=" x 30;
say center("Perl Lessons", 30);   # prints centered text
say "=" x 30;
