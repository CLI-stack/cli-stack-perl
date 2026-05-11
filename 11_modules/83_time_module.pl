#!/usr/bin/perl
# LESSON 83: Working with Time in Perl

use strict;
use warnings;
use feature 'say';
use POSIX qw(strftime);

# time() returns seconds since Unix epoch (Jan 1, 1970)
my $epoch = time();
say "Epoch seconds: $epoch";

# localtime() in list context returns time components
my @t = localtime($epoch);
# ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
my ($sec, $min, $hour, $mday, $mon, $year, $wday) = @t;

# Note: $mon is 0-11, $year is years since 1900
printf "Date: %04d-%02d-%02d\n", $year+1900, $mon+1, $mday;
printf "Time: %02d:%02d:%02d\n", $hour, $min, $sec;

# localtime() in scalar context = human readable string
say "Human readable: " . scalar(localtime());

# strftime for formatted output
say "\nFormatted:";
say strftime "%Y-%m-%d",          localtime;
say strftime "%H:%M:%S",          localtime;
say strftime "%A, %B %d, %Y",     localtime;
say strftime "%Y%m%d_%H%M%S",     localtime;  # good for filenames

# Day of week
my @days = qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday);
say "Today is: $days[$wday]";

# Elapsed time measurement
my $start = time();
my $sum = 0;
$sum += $_ for 1..1_000_000;
my $end = time();
say "\n1M sum = $sum";
say "Elapsed: " . ($end - $start) . " seconds";

# For sub-second timing use Time::HiRes
use Time::HiRes qw(time);
my $t0 = time();
$sum = 0; $sum += $_ for 1..100_000;
my $t1 = time();
printf "100K sum elapsed: %.4f seconds\n", $t1 - $t0;
