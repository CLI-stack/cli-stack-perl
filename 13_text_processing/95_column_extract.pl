#!/usr/bin/perl
# LESSON 95: Text Processing - Column Extraction and Reporting

use strict;
use warnings;
use feature 'say';

# Simulate system process list
my @ps_output = (
    "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND",
    "root         1  0.0  0.1 225828  9104 ?        Ss   Jan14   0:02 /sbin/init",
    "root       512  0.0  0.0   5828  1780 ?        Ss   Jan14   0:00 /sbin/sshd",
    "alice     1024  2.5  1.2 654320 98000 pts/0    S    08:00   0:30 perl myapp.pl",
    "bob       1025  0.1  0.3 123456 24600 pts/1    S    08:01   0:05 python3 script.py",
    "alice     1030 15.0  2.0 987654 164000 pts/0   R    08:05   1:20 perl heavy_job.pl",
    "root      1100  0.0  0.0   3128   780 ?        S    08:10   0:00 sleep 60",
);

# Skip header
my $header = shift @ps_output;
say "=== Process Analysis ===";
say $header;
say "-" x length($header);

my @procs;
for my $line (@ps_output) {
    # Parse fixed-width or split on whitespace
    my @fields = split /\s+/, $line, 11;
    my %proc = (
        user    => $fields[0],
        pid     => $fields[1],
        cpu     => $fields[2],
        mem     => $fields[3],
        command => $fields[10] // "",
    );
    push @procs, \%proc;
    say $line;
}

# Report: processes by user
say "\n=== By User ===";
my %by_user;
for my $p (@procs) {
    push @{$by_user{$p->{user}}}, $p;
}
for my $user (sort keys %by_user) {
    say "  $user: " . scalar(@{$by_user{$user}}) . " process(es)";
}

# Top CPU consumers
say "\n=== Top CPU ===";
my @sorted = sort { $b->{cpu} <=> $a->{cpu} } @procs;
printf "  %-8s %5s %5s  %s\n", "USER", "PID", "%CPU", "COMMAND";
for my $p (@sorted[0..2]) {
    printf "  %-8s %5s %5s  %s\n", $p->{user}, $p->{pid}, $p->{cpu}, substr($p->{command},0,30);
}

# High CPU warning
my @high_cpu = grep { $_->{cpu} > 5 } @procs;
if (@high_cpu) {
    say "\nWARNING: High CPU processes:";
    say "  PID $_{pid} ($_{user}): $_->{cpu}%" for @high_cpu;
}
