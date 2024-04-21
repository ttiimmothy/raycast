#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Generate open repository.json
# @raycast.mode compact

# Optional parameters:
# @raycast.packageName Repository
# @raycast.icon ../favicons/recent_favicon2.ico
# @raycast.iconDark ../favicons/dark_recent_favicon2.ico

# Documentation:
# @raycast.description generate repository.json to list all openrice canada organization repositories
# @raycast.author timoptimothy
# @raycast.authorURL https://raycast.com/timoptimothy

if [ -f .env ]; then
  source .env
fi
USERNAME=$USERNAME
TOKEN=$TOKEN
OPENRICE_CANADA_ORGANIZATION_PATH="$HOME/developer/github_repository/openrice_canada_organization"
# green="\033[0;32m"
index=1
echo "{\"repository_url\":{" > $OPENRICE_CANADA_ORGANIZATION_PATH/repository.json
REPO_URL="https://api.github.com/user/repos?per_page=100&page=${page}"
REPOS=$(curl -s -H "Authorization: Bearer ${TOKEN}" ${REPO_URL} | grep -o '"ssh_url": "git@github.com:openrice-canada[^"]*"' | awk -F'"' '{print $4}')
for repo in ${REPOS}; do
  repo_name=$(basename ${repo})
  echo "\"${index}\": [\"${repo_name}\"]," >> $OPENRICE_CANADA_ORGANIZATION_PATH/repository.json
  ((index++))
done
echo "}}" >> $OPENRICE_CANADA_ORGANIZATION_PATH/repository.json
echo "Finish generating"