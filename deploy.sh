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

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    # Add changes to git.
	git pull
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
	# Push source and build repos.
	git push origin master
else
    echo "Diverged"
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

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    # Add changes to git.
	git pull
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
	# Push source and build repos.
	git push origin master
else
    echo "Diverged"
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

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    # Add changes to git.
	git pull
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
	# Push source and build repos.
	git push origin master
else
    echo "Diverged"
fi
