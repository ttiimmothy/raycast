#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title World clock
# @raycast.mode inline
# @raycast.refreshTime 3s

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

los_angeles=$(TZ=America/Los_Angeles date +"%H:%M")
vancouver=$(TZ=America/Vancouver date +"%H:%M")
edmonton=$(TZ=America/Edmonton date +"%H:%M")
toronto=$(TZ=America/Toronto date +"%H:%M")
hong_kong=$(TZ=Asia/Hong_Kong date +"%H:%M")
tokyo=$(TZ=Asia/Tokyo date +"%H:%M")
melbourne=$(TZ=Australia/Melbourne date +"%H:%M")

# echo "Los Angeles, Vancouver : $los_angeles | Edmonton: $edmonton | Toronto: $toronto | Hong Kong: $hong_kong | Tokyo: $tokyo | Melbourne: $melbourne"
echo "Vancouver: $los_angeles | Edmonton: $edmonton | Tokyo: $tokyo"