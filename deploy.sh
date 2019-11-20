#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
#hugo # if using a theme, replace with `hugo -t <YOURTHEME>`
#Hugo Static Site Generator v0.57.0-9B00E647 linux/amd64 BuildDate: 2019-08-14T08:06:27Z
hugo --theme=weii --baseUrl="https://blog.weii.ink/" --enableGitInfo --ignoreCache --ignoreVendor


# ALL
printf "\033[0;32mAll updates to GitHub...\033[0m\n"

git add .
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

UPSTREAM1=${1:-'@{u}'}
LOCAL1=$(git rev-parse @)
REMOTE1=$(git rev-parse "$UPSTREAM")
BASE1=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL1 = $REMOTE1 ]; then
    printf "\033[0;32mALL Up-to-date\033[0m\n"
elif [ $LOCAL1 = $BASE1 ]; then
	printf "\033[0;32mALL Need to pull\033[0m\n"
    # Add changes to git.
	git pull
elif [ $REMOTE1 = $BASE1 ]; then
    printf "\033[0;32mALL Need to push\033[0m\n"
	# Push source and build repos.
	git push origin master
else
    printf "\033[0;32mALL Diverged\033[0m\n"
fi


# Public
printf "\033[0;32mPublic updates to GitHub...\033[0m\n"
# Go To Public folder
cd public

git add .
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

UPSTREAM2=${1:-'@{u}'}
LOCAL2=$(git rev-parse @)
REMOTE2=$(git rev-parse "$UPSTREAM")
BASE2=$(git merge-base @ "$UPSTREAM")
if [ $LOCAL2 = $REMOTE2 ]; then
    printf "\033[0;32mPublic Up-to-date\033[0m\n"
elif [ $LOCAL2 = $BASE2 ]; then
	printf "\033[0;32mPublic Need to pull\033[0m\n"
    # Add changes to git.
	git pull
elif [ $REMOTE2 = $BASE2 ]; then
    printf "\033[0;32mPublic Need to push\033[0m\n"
	# Push source and build repos.
	git push origin master
else
    printf "\033[0;32mPublic Diverged\033[0m\n"
fi


# Weii Themes
printf "\033[0;32mThemes updates to GitHub...\033[0m\n"
# Go To Public folder
cd ../themes/weii

git add .
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

UPSTREAM3=${1:-'@{u}'}
LOCAL3=$(git rev-parse @)
REMOTE3=$(git rev-parse "$UPSTREAM")
BASE3=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL3 = $REMOTE3 ]; then
    printf "\033[0;32mThemes Up-to-date\033[0m\n"
elif [ $LOCAL3 = $BASE3 ]; then
	printf "\033[0;32mThemes Need to pull\033[0m\n"
    # Add changes to git.
	git pull
elif [ $REMOTE3 = $BASE3 ]; then
    printf "\033[0;32mThemes Need to push\033[0m\n"
	# Push source and build repos.
	git push origin master
else
    printf "\033[0;32mThemes Diverged\033[0m\n"
fi
