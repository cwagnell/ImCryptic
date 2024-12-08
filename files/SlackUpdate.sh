#!/bin/bash
pattern="]: [^<].*[^.] joined the game"
tail -f /home/container/logs/latest.log \
        | grep --line-buffered "$pattern" \
        | while read -r line; do
                curl --silent --output /dev/null -X POST -H 'Content-type: application/json' --data "{\"text\":\"MC Server: $line\"}" _URL_
        done
