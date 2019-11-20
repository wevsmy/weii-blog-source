#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
#hugo # if using a theme, replace with `hugo -t <YOURTHEME>`
#Hugo Static Site Generator v0.57.0-9B00E647 linux/amd64 BuildDate: 2019-08-14T08:06:27Z
hugo --theme=weii --baseUrl="https://blog.weii.ink/" --enableGitInfo --ignoreCache --ignoreVendor


# ALL
# Add changes to git.
git pull
git add .
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
# Push source and build repos.
git push origin master


# Public
# Go To Public folder
cd public
# Add changes to git.
git pull
git add .
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
# Push source and build repos.
git push origin master


# Weii Themes
# Go To Public folder
cd ../themes/weii
# Add changes to git.
git pull
git add .
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
# Push source and build repos.
git push origin master