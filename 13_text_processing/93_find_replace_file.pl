#!/usr/bin/perl
# LESSON 93: Find and Replace in Files
# Read a file, substitute patterns, and write the result

use strict;
use warnings;
use feature 'say';

# Create a template file with {{PLACEHOLDER}} tokens
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

# Dictionary of placeholder => replacement values
my %vars = (
    NAME        => "Alice Rahman",         # what to substitute for {{NAME}}
    COMPANY     => "Tech Corp Sdn Bhd",
    EMPLOYEE_ID => "EMP-2025-042",
    DEPARTMENT  => "Software Engineering",
    START_DATE  => "15 January 2025",
    LOCATION    => "Level 10, Block B",
    SENDER      => "HR Department",
);

# Read template, substitute all placeholders, write to output file
open($fh,          '<', $infile)   or die "Read failed: $!";
open(my $out, '>', $outfile) or die "Write failed: $!";

while (my $line = <$fh>) {
    # s/\{\{(\w+)\}\}/ ... /ge - global substitution with eval
    # \{\{ and \}\} = literal {{ and }} characters
    # (\w+)         = capture the placeholder name into $1
    # /g            = replace ALL placeholders on the line
    # /e            = evaluate replacement as Perl code
    $line =~ s/\{\{(\w+)\}\}/$vars{$1} \/\/ "MISSING_$1"/ge;
    # $vars{$1} looks up the value; // "MISSING_$1" = fallback if key not found
    print $out $line;   # write the processed line to output file
}
close($fh);
close($out);

# Display the generated letter
say "=== Generated letter ===";
open($fh, '<', $outfile) or die $!;
print while <$fh>;    # print each line (uses $_ automatically)
close($fh);

# In-place file editing using Perl's diamond operator and $^I
my $file = "/tmp/quick_replace.txt";
open($fh, '>', $file) or die $!;
print $fh "foo bar foo baz foo\n" x 3;   # write 3 identical lines
close($fh);

{
    local @ARGV = ($file);    # set @ARGV to the file we want to edit
    local $^I   = ".bak";    # $^I enables in-place editing; ".bak" = backup file extension
    while (<>) {              # <> reads from files in @ARGV (our file)
        s/foo/REPLACED/g;     # replace all occurrences of "foo"
        print;                # print modified line back to file
    }
}
say "\nIn-place replacement done. See $file";
