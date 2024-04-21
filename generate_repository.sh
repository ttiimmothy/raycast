#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Generate personal repository.json
# @raycast.mode compact

# Optional parameters:
# @raycast.packageName Repository
# @raycast.icon ../favicons/recent_favicon2.ico
# @raycast.iconDark ../favicons/dark_recent_favicon2.ico

# Documentation:
# @raycast.description generate repository.json to list all my personal repositories
# @raycast.author timoptimothy
# @raycast.authorURL https://raycast.com/timoptimothy

if [ -f .env ]; then
  source .env
fi
USERNAME=$USERNAME
TOKEN=$TOKEN
index=1
echo "{\"repository_url\":{" > $HOME/developer/github_repository/repository.json
for page in {1..3}; do
  REPO_URL="https://api.github.com/user/repos?per_page=100&page=${page}"
  REPOS=$(curl -s -H "Authorization: Bearer ${TOKEN}" ${REPO_URL} | grep -o '"ssh_url": "git@github.com:ttiimmothy[^"]*"' | awk -F'"' '{print $4}')
  for repo in ${REPOS}; do
    repo_name=$(basename ${repo})
    echo "\"${index}\": [\"${repo_name}\"]," >> $HOME/developer/github_repository/repository.json
    ((index++))
  done
done
echo "}}" >> $HOME/developer/github_repository/repository.json
echo "Finish generating"