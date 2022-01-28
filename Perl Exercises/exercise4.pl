#!/usr/bin/perl -w

use strict;
use warnings;

#my $newimg = "christmas.png";

open(IN, "<parameter.html") or die("$! not opened");
open(OUT,">modified.html") or die("$! not opened");

while(<IN>){
  my $infile = $_;
   while($infile =~ /<img[^>]+src\s*=\s*['"]([^'"]+)['"][^>]*>/gi){
  	$infile =~ s/$1/'christmas.png'/;
  }
  print OUT $infile;
}
print "modified\n";
close IN;
close OUT;

#/<img[^>]+src\s*=\s*['"]([^'"]+)['"][^>]*>/g
