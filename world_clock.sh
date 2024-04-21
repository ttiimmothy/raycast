#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title World clock
# @raycast.mode inline
# @raycast.refreshTime 5s

# Optional parameters:
# @raycast.packageName Clock
# @raycast.icon ../favicons/recent_favicon2.ico
# @raycast.iconDark ../favicons/dark_recent_favicon2.ico
#
# Documentation:
# @raycast.description Show the time from elsewhere in the world
# @raycast.author timoptimothy
# @raycast.authorURL https://raycast.com/timoptimothy

# Timezones can be found in /usr/share/zoneinfo

vancouver=$(TZ=America/Vancouver date +"%H:%M")
calgary=$(TZ=America/Edmonton date +"%H:%M")
toronto=$(TZ=America/Toronto date +"%H:%M")
hong_kong=$(TZ=Asia/Hong_Kong date +"%H:%M")
tokyo=$(TZ=Asia/Tokyo date +"%H:%M")

# echo "Vancouver, Los Angeles: $vancouver | Calgary: $calgary | Toronto: $toronto | Hong Kong: $hong_kong | Tokyo: $tokyo"
echo "Vancouver: $vancouver | Tokyo: $tokyo"