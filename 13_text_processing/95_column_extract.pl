#!/usr/bin/perl
# LESSON 95: Column Extraction and Reporting
# Parse structured text output and produce formatted reports

use strict;
use warnings;
use feature 'say';

# Simulated 'ps aux' output (process list)
my @ps_output = (
    "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND",
    "root         1  0.0  0.1 225828  9104 ?        Ss   Jan14   0:02 /sbin/init",
    "root       512  0.0  0.0   5828  1780 ?        Ss   Jan14   0:00 /sbin/sshd",
    "alice     1024  2.5  1.2 654320 98000 pts/0    S    08:00   0:30 perl myapp.pl",
    "bob       1025  0.1  0.3 123456 24600 pts/1    S    08:01   0:05 python3 script.py",
    "alice     1030 15.0  2.0 987654 164000 pts/0   R    08:05   1:20 perl heavy_job.pl",
    "root      1100  0.0  0.0   3128   780 ?        S    08:10   0:00 sleep 60",
);

my $header = shift @ps_output;   # remove and store the header line
say "=== Process Analysis ===";
say $header;                      # show the header
say "-" x length($header);        # underline it

my @procs;   # will hold parsed process records
for my $line (@ps_output) {
    # split on whitespace, but limit to 11 parts so COMMAND (last field) stays together
    my @fields = split /\s+/, $line, 11;
    my %proc = (
        user    => $fields[0],    # username
        pid     => $fields[1],    # process ID
        cpu     => $fields[2],    # CPU percentage
        mem     => $fields[3],    # memory percentage
        command => $fields[10] // "",  # full command (may be missing if short line)
    );
    push @procs, \%proc;   # store as hash reference
    say $line;              # also print the original line
}

# Group processes by user
my %by_user;
for my $p (@procs) {
    push @{$by_user{$p->{user}}}, $p;   # add process to user's group
}

say "\n=== By User ===";
for my $user (sort keys %by_user) {
    say "  $user: " . scalar(@{$by_user{$user}}) . " process(es)";
}

# Sort by CPU usage (descending) and show top consumers
say "\n=== Top CPU Consumers ===";
my @sorted = sort { $b->{cpu} <=> $a->{cpu} } @procs;   # sort descending by %CPU
printf "  %-8s %5s %5s  %s\n", "USER", "PID", "%CPU", "COMMAND";
for my $p (@sorted[0..2]) {   # show top 3
    printf "  %-8s %5s %5s  %s\n",
        $p->{user}, $p->{pid}, $p->{cpu}, substr($p->{command}, 0, 30);
}

# Alert on high CPU
my @high_cpu = grep { $_->{cpu} > 5 } @procs;   # filter processes above 5% CPU
if (@high_cpu) {
    say "\nWARNING: High CPU processes:";
    for my $p (@high_cpu) {
        say "  PID $p->{pid} ($p->{user}): $p->{cpu}%";
    }
}
