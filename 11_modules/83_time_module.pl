#!/usr/bin/perl
# LESSON 83: Working with Time
# Perl's built-in time functions and the Time::HiRes module

use strict;
use warnings;
use feature 'say';
use POSIX qw(strftime);           # for formatted date/time strings
use Time::HiRes qw(time);        # overrides time() with sub-second precision

# time() returns seconds since the Unix epoch (midnight January 1, 1970 UTC)
my $epoch = time();
say "Epoch seconds: $epoch";   # large number like 1705312800

# localtime() in LIST context returns 9 components of current local time
my @t = localtime($epoch);
# @t contains: (seconds, minutes, hours, day, month, year, weekday, yearday, dst)
my ($sec, $min, $hour, $mday, $mon, $year, $wday) = @t;
# IMPORTANT: $mon is 0-11 (January=0), $year is years since 1900

printf "Date: %04d-%02d-%02d\n", $year+1900, $mon+1, $mday;   # add 1900 to year, 1 to month
printf "Time: %02d:%02d:%02d\n", $hour, $min, $sec;            # format with leading zeros

# localtime() in SCALAR context returns a human-readable string
say "Human readable: " . scalar(localtime());   # "Mon Jan 15 14:30:00 2025"

# strftime() - format date/time with format codes (like C's strftime)
say "\nFormatted dates:";
say strftime "%Y-%m-%d",          localtime;   # 2025-01-15
say strftime "%H:%M:%S",          localtime;   # 14:30:00
say strftime "%A, %B %d, %Y",    localtime;   # Monday, January 15, 2025
say strftime "%Y%m%d_%H%M%S",    localtime;   # 20250115_143000 (safe for filenames)

# Day of week names
my @days = qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday);
say "Today is: $days[$wday]";   # $wday is 0=Sunday, 1=Monday, ..., 6=Saturday

# Measure elapsed time
my $start = time();         # record start (using Time::HiRes version for precision)
my $sum   = 0;
$sum += $_ for 1..100_000;  # do some work
my $end   = time();         # record end

printf "100K sum elapsed: %.4f seconds\n", $end - $start;  # sub-second precision
