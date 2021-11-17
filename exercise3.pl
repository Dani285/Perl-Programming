#!/usr/bin/perl -w
%freq = ();
$file = 'war_peace.txt';
open FH,'<',$file  or die("Can't open this file.");
print "Type something: ";
while(<FH>){
    $input = <FH>;
    chomp($input = <STDIN>);
    if($input eq ''){last;}
    foreach $word(split /\s+/,$input){
      if($input =~/(\b[^\W_\d][\w'-]+\b)/g){
          $freq{$word}++;
      }
    }
}
foreach $key(sort keys %freq)
{
      print $key," ",$freq{$key},"times","\n";
}
close(FH);

