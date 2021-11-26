#!/usr/bin/perl -w
#filter the email addresses within text file
#regex: ~ /^[^@]+@+[^\.]+\.+[^\.]{2,6}$/
#$file = "C:\\Users\\kaloc\\Desktop\\Perl\\input.txt";
#Solution for Task 2

open(FH,'<', 'input.txt') or die ("Couldn't open the input.txt file");
while(<FH>) {
  @words = split(' ');
  foreach $word(@words){
     if($word =~ /^[^@]+@+[^\.]+\.+[^\.]{2,6}$/){
         print "$word\n";
     }
  }
}
close(FH);
