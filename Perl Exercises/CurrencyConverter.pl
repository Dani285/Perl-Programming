#!usr/bin/perl

#Convert currency from one type to another
use strict;
use warnings;

use Finance::Currency::Convert::XE;

my $converter = Finance::Currency::Convert::XE->new();

sub Usage(){
  print "Usage is $0 <amount><code> <to-code>\n";
  exit(8);
}
if(($#ARGV == 0) && ($ARGV[0] eq -1)){
  my $info = $converter->{Currency};
  
  foreach my $symb(sort keys %$info){
    print "$symb $info->{$symb}->{name}\n";
  }
  exit(0);
}
if($#ARGV != 1){
  Usage();
}

if($ARGV[0] !~ /^[-+]?\d*(?:\.\d*)?(\S+)$/){
   Usage();
}
my $Amount = $1;
my $From = $2;
my $To = $ARGV[1];

if($amount !~ /\d/){
  Usage();
}

my $newAmount = $converter->convert(
  'source' => $From,
  'target' => $To,
  'value' => $Amount,
  'format' => 'text'
  );

if(not defined($new_amount)){
  print "Could not convert: " . $converter->error . "\n";
  exit(8);
}

my @currencies = $converter->currencies;

print "$Amount $From => $newAmount";
