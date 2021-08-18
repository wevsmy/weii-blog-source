#!/bin/sh

# If a command fails then the deploy stops
set -e

BASE_DIR=$(
  cd "$(dirname "$0")" || exit
  pwd
)

echo "update themes\weii\static\script\BingWallpaperInfo.json"

BingWallpaperPATH="$BASE_DIR\themes\weii\static\script\BingWallpaper.py"

echo "run"
python3 $BingWallpaperPATH
echo "done"