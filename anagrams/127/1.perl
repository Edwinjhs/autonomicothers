#!/usr/bin/perl
use strict;
use warnings;

my %dic = ();
open (WRD, "words.txt");
while (my $word = <WRD>) {
    chomp ($word);
    $dic{join ("", sort split (//, $word))}++;
}
close (WRD);

open (IN, "input.txt");
<IN>;
my @output = ();
while (my $input = <IN>) {
    chomp ($input);
    my $output = $dic{join ("", sort split (//, $input))} - 1 || 0;
    push (@output, $output);
}
close (IN);

open (OUT, ">output.txt");
print OUT join (" ", @output);
close (OUT);
