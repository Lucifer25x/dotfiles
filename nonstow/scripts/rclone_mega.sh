#!/usr/bin/env bash

set -euo pipefail

REMOTE="mega:rclone"

sync_dir() {
    local SRC="$1"
    local DST="$2"

    echo "Syncing $SRC..."
    rclone sync "$SRC" "$DST" --progress
}

sync_dir ~/Documents/Backup    "$REMOTE/Backup"
sync_dir ~/Documents/Security  "$REMOTE/Security"
sync_dir ~/Documents/knowledge "$REMOTE/knowledge"
sync_dir ~/Documents/Books     "$REMOTE/Books"
sync_dir ~/Documents/UNEC      "$REMOTE/UNEC"
sync_dir ~/Music/Personal      "$REMOTE/Personal"
sync_dir ~/Pictures            "$REMOTE/Pictures"

echo "Done."
