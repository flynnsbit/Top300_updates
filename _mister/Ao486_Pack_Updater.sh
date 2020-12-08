#!/bin/bash

LOCATION=$(curl -s -k https://api.github.com/repos/flynnsbit/Top300_updates/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/flynnsbit/Top300_updates/archive/" substr($2, 2, length($2)-3) ".zip"}') \
; curl -k -L -o /media/fat/games/ao486/shared/t300upd.zip $LOCATION






