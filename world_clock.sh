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

green="\033[0;32m"
blue="\033[1;34m"
cyan="\033[0;36m"
no_color='\033[0m'
los_angeles=$(TZ=America/Los_Angeles date +"%H:%M")
vancouver=$(TZ=America/Vancouver date +"%H:%M")
edmonton=$(TZ=America/Edmonton date +"%H:%M")
toronto=$(TZ=America/Toronto date +"%H:%M")
hong_kong=$(TZ=Asia/Hong_Kong date +"%H:%M")
tokyo=$(TZ=Asia/Tokyo date +"%H:%M")
melbourne=$(TZ=Australia/Melbourne date +"%H:%M")

# echo -e "Los Angeles: $los_angeles ${green}|${no_color} Vancouver: $vancouver ${green}|${no_color} Edmonton: $edmonton ${green}|${no_color} Toronto: $toronto ${green}|${no_color} Hong Kong: $hong_kong ${green}|${no_color} Tokyo: $tokyo ${green}|${no_color} Melbourne: $melbourne"
echo -e "Vancouver: $vancouver ${blue}|${no_color} Edmonton: $edmonton ${blue}|${no_color} Tokyo: $tokyo"