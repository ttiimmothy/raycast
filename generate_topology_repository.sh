#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Generate topology symmetry repository.json
# @raycast.mode compact

# Optional parameters:
# @raycast.packageName Repository
# @raycast.icon ../favicons/recent_favicon2.ico
# @raycast.iconDark ../favicons/dark_recent_favicon2.ico

# Documentation:
# @raycast.description generate repository.json to list all topology symmetry organization repositories
# @raycast.author timoptimothy
# @raycast.authorURL https://raycast.com/timoptimothy

if [ -f .env ]; then
  source .env
fi
USERNAME=$USERNAME
TOKEN=$TOKEN
TOPOLOGY_SYMMETRY_ORGANIZATION_PATH="$HOME/developer/github_repository/topology_symmetry_organization"
# green="\033[0;32m"
index=1
echo "{\"repository_url\":{" > $TOPOLOGY_SYMMETRY_ORGANIZATION_PATH/repository.json
REPO_URL="https://api.github.com/user/repos?per_page=100&page=${page}"
REPOS=$(curl -s -H "Authorization: Bearer ${TOKEN}" ${REPO_URL} | grep -o '"ssh_url": "git@github.com:topology-symmetry[^"]*"' | awk -F'"' '{print $4}')
for repo in ${REPOS}; do
  repo_name=$(basename ${repo})
  echo "\"${index}\": [\"${repo_name}\"]," >> $TOPOLOGY_SYMMETRY_ORGANIZATION_PATH/repository.json
  ((index++))
done
echo "}}" >> $TOPOLOGY_SYMMETRY_ORGANIZATION_PATH/repository.json
echo "Finish generating"