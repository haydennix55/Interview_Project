#!/usr/bin/perl

use strict;
use warnings;
use Math::Trig;
use Math::Round;
 
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

                $profile[6] = nearest(0.001,((atan($profile[6]) + (pi/2))*100)/pi); #conversion for courage
                $profile[7] = nearest(0.001,((atan($profile[7]) + (pi/2))*100)/pi); #conversion for stupidity

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

                        $profile[6] = nearest(0.001,((atan($profile[6]) + (pi/2))*100)/pi); #conversion for courage
                        $profile[7] = nearest(0.001,((atan($profile[7]) + (pi/2))*100)/pi); #conversion for stupidity

                        for (my $i = 0; $i < 9; $i++){
                                $json = $json."\t".$fields[$i].":".$profile[$i].",\n";
                        }       

                        $json =~ s/,$//; #remove trailing comma in object
                        $json = $json."}\n";
        }
        print $json . "}\n";
}

