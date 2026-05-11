#!/usr/bin/perl
# LESSON 77: POSIX Module

use strict;
use warnings;
use feature 'say';
use POSIX qw(floor ceil fmod pow);

# floor and ceil
say "floor(4.7)  = " . floor(4.7);    # 4
say "floor(-4.7) = " . floor(-4.7);   # -5
say "ceil(4.2)   = " . ceil(4.2);     # 5
say "ceil(-4.2)  = " . ceil(-4.2);    # -4

# Round to nearest integer
sub round { return floor($_[0] + 0.5) }
say "round(4.5)  = " . round(4.5);    # 5
say "round(4.4)  = " . round(4.4);    # 4

# Modulo for floats
say "\nfmod(10.5, 3.2) = " . fmod(10.5, 3.2);

# POSIX integer limits
use POSIX qw(INT_MAX INT_MIN DBL_MAX);
say "\nINT_MAX = " . INT_MAX;
say "INT_MIN = " . INT_MIN;

# String/character functions
use POSIX qw(isdigit isalpha isspace isupper islower);
for my $c ('A', 'a', '5', ' ', '!') {
    printf "  '%s' : digit=%d alpha=%d space=%d upper=%d lower=%d\n",
        $c,
        isdigit(ord($c)),
        isalpha(ord($c)),
        isspace(ord($c)),
        isupper(ord($c)),
        islower(ord($c));
}

# mktime / strftime for time formatting
use POSIX qw(strftime);
my $now = strftime "%Y-%m-%d %H:%M:%S", localtime;
say "\nNow: $now";
say "Date: " . strftime("%A, %B %d, %Y", localtime);
