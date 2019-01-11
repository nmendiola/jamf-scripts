#!/bin/bash

##########################################################################################

filename="$1"
JSS="ADD THE Jamf Pro URL HERE e.g. https://jss.pretendoco.com:8443"
groupid="ADD THE GROUP ID HERE"
read -p "Please enter your Jamf Pro user account : " JSSUSER
read -p "Please enter the password for the account: " -s JSSPASS

echo ""

cat $filename|while read line
  do
    echo $line
	  curl -s -k $JSS/JSSResource/computergroups/id/$groupid -u $JSSUSER:$JSSPASS -X PUT -H Content-type:application/xml --data "<computer_group><id>$groupid</id><computer_additions><computer><id>$line</id></computer></computer_additions></computer_group>"

  done

exit 0
