#!/bin/bash
pattern="]: [^<].*[^.] joined the game"
while IFS= read line; do 
	newLine=$(grep "$pattern" <<< "$line")
	if [ "$newLine" != "" ]
		then curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"MC Server: $newLine\"}" https://hooks.slack.com/services/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
	fi 
done
