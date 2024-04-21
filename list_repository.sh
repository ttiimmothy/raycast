#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title List all my personal and organizational repositories
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.packageName Repository
# @raycast.icon ../favicons/recent_favicon2.ico
# @raycast.iconDark ../favicons/dark_recent_favicon2.ico

# Documentation:
# @raycast.description list all my personal and organizational github repositories
# @raycast.author timoptimothy
# @raycast.authorURL https://raycast.com/timoptimothy

if [ -f .env ]; then
  source .env
fi
USERNAME=$USERNAME
TOKEN=$TOKEN
red="\033[0;31m"
green="\033[0;32m"
yellow="\033[1;33m"
no_color='\033[0m'
index=1
for page in {1..3}; do
  REPO_URL="https://api.github.com/user/repos?per_page=100&page=${page}"
  REPOS=$(curl -s -H "Authorization: Bearer ${TOKEN}" ${REPO_URL} | grep -E -o '"ssh_url": "git@github.com:ttiimmothy[^"]*"|"ssh_url": "git@github.com:openrice-canada[^"]*"|"ssh_url": "git@github.com:topology-symmetry[^"]*"|"ssh_url": "git@github.com:robot-analytics[^"]*"' | awk -F'"' '{print $4}')
  for repo in ${REPOS}; do
    path="${repo#git@github.com:}"
    path="${path%.git}"
    username=$(dirname ${path})
    repo_name=$(basename ${path})
    echo -e "${yellow}${index}  ${red}${username} ${no_color} ${repo_name}"
    ((index++))
  done
done