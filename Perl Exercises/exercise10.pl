#!/usr/bin/perl -w

use strict;
use warnings;

my %freq = ();
my ($terms, $searching) = @ARGV;
sub Kolakoski{
    my @seed = (1,2);
    my ($terms) = @_;
    my @list;

    my $kol = 0;
    if($seed[0] == 1){
        $kol = 1;
    }

    if ($kol == 1) {
        @list = (1, split //, ($seed[1] x $seed[1]));
    }else{
        @list = ($seed[0]) x $seed[0];
    }
   do {
        $kol++;
        push @list, ($seed[$kol % @seed]) x $list[$kol];
    } until $terms <= @list;

    return(@list[0..$terms-1]);
}
my @kola = Kolakoski($terms);
print join(",",@kola) . "\n";
my $jkol = join("",@kola);
my $count = 0;
while($jkol=~/($searching)/gi){
  $freq{$count}++;
}
print "$freq{$count} times appeared\n";
