#!/usr/bin/perl

use strict;
use warnings;
 
open(my $csv, '<', $ARGV[0]);

my $line = <$csv>;
chomp $line;

my @fields = split "," , $line;

my $json = "{\n";
while ( $line = <$csv>) {
                chomp $line;
                $json = $json."{\n";
                my @profile = split "," , $line;

                for (my $i = 0; $i < 9; $i++){
                        $json = $json.$fields[$i].":".$profile[$i].",\n";
                }

                $json =~ s/,$//; #remove trailing comma in object
                $json = $json."}\n";
}
print $json . "}\n";
