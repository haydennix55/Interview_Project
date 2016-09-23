# Interview_Project
Print csv file, with header line of fields and other lines of objects, in JSON array format

###Running instructions
        
In Interview_Project directory, run command: 
        ```
        perl converter.pl kerbal.csv json
        ```
to print the data in JSON array format.

Alternately, run command
        ```
        perl converter.pl kerbal.csv xml
        ```
to print the data in XML format.

####NOTE:
The conversion option required use of Math::Trig and Math::Libraries, which are native on Mac.
However need to be installed on Linux/Unix.  If this is an issue, instead run 
        ```
        perl converterBackup.pl kerbal.csv json
        ```
or
        ```
        perl converterBackup.pl kerbal.csv xml
        ```
This has both the XML and JSON print options, without the conversions.
