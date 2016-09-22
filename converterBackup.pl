#!/usr/bin/perl

use strict;
use warnings;
 
open(my $csv, '<', $ARGV[0]);

my $line = <$csv>;
chomp $line;
my @fields = split "," , $line;


if ($ARGV[1] eq  "xml"){ #prints xml format

        my $xml = "<XML>\n";

        while ( $line = <$csv>) {
                chomp $line;
                $xml = $xml."\t<object>\n";
                my @profile = split "," , $line;


                for (my $i = 0; $i < 9; $i++){
                        $xml = $xml."\t\t<".$fields[$i].">".$profile[$i]."</".$fields[$i].">\n" #string formatting for readability
                }

                $xml = $xml."\t</object>\n";
        }

print $xml."\n</xml>\n";;

}



else { #prints json array format

        my $json = "{\n";
        while ( $line = <$csv>) {
                        chomp $line;
                        $json = $json."{\n";
                        my @profile = split "," , $line;


                        for (my $i = 0; $i < 9; $i++){
                                $json = $json."\t".$fields[$i].":".$profile[$i].",\n";
                        }       

                        $json =~ s/,$//; #remove trailing comma in object
                        $json = $json."}\n";
        }
        print $json . "}\n";
}

