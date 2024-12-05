#!/bin/bash
pattern="]: [^<].*[^.] joined the game"
while IFS= read line; do 
	newLine=$(grep "$pattern" <<< "$line")
	if [ "$newLine" != "" ]
		then curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"MC Server: $newLine\"}" _URL_
	fi 
done
