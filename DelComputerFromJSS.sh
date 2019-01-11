#!/bin/bash

##########################################################################################
### Deletes entry from JSS via Serial Number from a text or csv file.


filename="$1"
jssURL="ADD Jamf Pro URL here e.g. https://jss.pretendco.com:8443/JSSResource/computers/serialnumber/"
read -p "Please enter your Jamf Pro user account : " username
read -p "Please enter the password for the account: " -s password

echo ""

while read -r SN
do

    curl -X DELETE $jssURL$SN -u $username:$password

done < "$filename"

exit 0
