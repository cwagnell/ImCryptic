#!/bin/bash
pattern="]: [^<].*[^.] joined the game"
tail -f /home/cam/logs/latest.log \
        | grep --line-buffered "$pattern" \
        | while read -r line; do
                curl --silent --output /dev/null -X POST -H 'Content-type: application/json' --data "{\"text\":\"MC Server: $line\"}" https://hooks.slack.com/services/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
        done
