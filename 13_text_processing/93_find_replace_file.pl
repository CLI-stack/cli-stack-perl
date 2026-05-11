#!/usr/bin/perl
# LESSON 93: Text Processing - Find and Replace in Files

use strict;
use warnings;
use feature 'say';

# Create a test file
my $infile  = "/tmp/template.txt";
my $outfile = "/tmp/output.txt";

open(my $fh, '>', $infile) or die $!;
print $fh <<'END';
Dear {{NAME}},

Welcome to {{COMPANY}}!

Your employee ID is {{EMPLOYEE_ID}}.
Your department is {{DEPARTMENT}}.
Your start date is {{START_DATE}}.

Please report to {{LOCATION}} on your first day.

Regards,
{{SENDER}}
END
close($fh);

# Template variables
my %vars = (
    NAME        => "Alice Rahman",
    COMPANY     => "Tech Corp Sdn Bhd",
    EMPLOYEE_ID => "EMP-2025-042",
    DEPARTMENT  => "Software Engineering",
    START_DATE  => "15 January 2025",
    LOCATION    => "Level 10, Block B",
    SENDER      => "HR Department",
);

# Read, replace, write
open($fh, '<', $infile)   or die "Read failed: $!";
open(my $out, '>', $outfile) or die "Write failed: $!";

while (my $line = <$fh>) {
    # Replace all {{PLACEHOLDER}} tokens
    $line =~ s/\{\{(\w+)\}\}/$vars{$1} \/\/ "MISSING_$1"/ge;
    print $out $line;
}
close($fh);
close($out);

# Show result
say "=== Generated letter ===";
open($fh, '<', $outfile) or die $!;
print while <$fh>;
close($fh);

# In-place edit (Perl one-liner style)
# perl -pi -e 's/old/new/g' filename
# In a script:
my $file = "/tmp/quick_replace.txt";
open($fh, '>', $file) or die $!;
print $fh "foo bar foo baz foo\n" x 3;
close($fh);

{
    local @ARGV = ($file);
    local $^I = ".bak";   # creates backup
    while (<>) {
        s/foo/REPLACED/g;
        print;
    }
}
say "\nIn-place replacement done. See $file";
