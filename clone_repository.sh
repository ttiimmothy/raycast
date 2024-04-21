#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clone repository for me
# @raycast.mode compact

# Optional parameters:
# @raycast.packageName Repository
# @raycast.icon ../favicons/recent_favicon2.ico
# @raycast.iconDark ../favicons/dark_recent_favicon2.ico

# Documentation:
# @raycast.description clone all my personal github repositories to local
# @raycast.author timoptimothy
# @raycast.authorURL https://raycast.com/timoptimothy

if [ -f .env ]; then
  source .env
fi
USERNAME=$USERNAME
TOKEN=$TOKEN

len_repository=0
for page in {1..3}; do
  REPO_URL="https://api.github.com/user/repos?per_page=100&page=${page}"
  REPOS=$(curl -s -H "Authorization: Bearer ${TOKEN}" ${REPO_URL} | grep -o '"ssh_url": "git@github.com:ttiimmothy[^"]*"' | awk -F'"' '!/manga-and-comics/ && !/stable-diffusion/ && !/porn-videos/{print $4}')
    for repo in ${REPOS}; do
    repo_name=$(basename ${repo} .git)
    repo_name_with_underscore=${repo_name//-/_}
    repo_local_path=$HOME/developer/github_repository/${repo_name_with_underscore}
    if [ ! -d $repo_local_path ]; then
      git clone "${repo}" $repo_local_path
      ((len_repository++))
    fi
  done
done

if [ $len_repository -gt 0 ]; then
  echo "clone $len_repository repository"
else
  echo "all repositories are already cloned"
fi