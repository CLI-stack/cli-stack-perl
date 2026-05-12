#!/usr/bin/perl
# LESSON 77: POSIX Module
# POSIX provides math functions and string/char utilities from the C standard library

use strict;
use warnings;
use feature 'say';
use POSIX qw(floor ceil fmod strftime);   # import specific functions we need

# floor() - round DOWN to nearest integer (always goes toward negative infinity)
say "floor(4.7)  = " . floor(4.7);    # 4  (not 5 - goes DOWN)
say "floor(-4.7) = " . floor(-4.7);   # -5 (further negative - still goes DOWN)

# ceil() - round UP to nearest integer (always goes toward positive infinity)
say "ceil(4.2)   = " . ceil(4.2);     # 5  (not 4 - goes UP)
say "ceil(-4.2)  = " . ceil(-4.2);    # -4 (less negative - still goes UP)

# Write our own round() using floor (Perl has no built-in round())
sub round { return floor($_[0] + 0.5) }   # add 0.5 then floor = round to nearest
say "round(4.5)  = " . round(4.5);   # 5
say "round(4.4)  = " . round(4.4);   # 4

# fmod() - floating point modulo (% only works on integers)
say "\nfmod(10.5, 3.2) = " . fmod(10.5, 3.2);   # remainder of 10.5 / 3.2

# strftime() - format time/date strings using C-style format codes
# localtime() returns time components for the current moment
say "\n=== Time Formatting with strftime ===";
say strftime "%Y-%m-%d",          localtime;   # 2025-01-15 (ISO date)
say strftime "%H:%M:%S",          localtime;   # 14:30:00  (24h time)
say strftime "%A, %B %d, %Y",    localtime;   # Monday, January 15, 2025
say strftime "%Y%m%d_%H%M%S",    localtime;   # 20250115_143000 (good for filenames)
say strftime "%I:%M %p",          localtime;   # 02:30 PM (12h format with AM/PM)

# POSIX character classification functions (take ASCII value with ord())
use POSIX qw(isdigit isalpha isspace isupper islower);
say "\n=== Character Classification ===";
for my $c ('A', 'a', '5', ' ') {
    printf "  '%s': digit=%d alpha=%d space=%d upper=%d lower=%d\n",
        $c, isdigit(ord $c), isalpha(ord $c), isspace(ord $c),
            isupper(ord $c), islower(ord $c);
    # ord() converts a character to its ASCII number
}
