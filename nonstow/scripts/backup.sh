#!/usr/bin/env bash

set -euo pipefail

DEST="/run/media/lucifer25x/BACKUP_USB"

########################################
# Backup Function (source → destination)
########################################
backup() {
    local SRC="$1"
    local DST="$2"

    echo ""
    echo "Checking \"$SRC\" → \"$DST\""

    mkdir -p "$DST"

    # rsync options matching robocopy behavior:
    # -a   archive (recursive, preserves perms/times)
    # -u   skip files that are newer on destination (like /XO)
    # -r   recursive (redundant with -a but explicit)
    # -t   preserve timestamps
    # --delete-after optional: mimic robocopy /MIR (not enabled here)
    # --info=progress2   show progress
    # --no-perms if you want to avoid permission copying
    #
    # Retry logic (equivalent to: /R:2 /W:3)
    #
    for attempt in 1 2; do
        if rsync -aru --info=progress2 "$SRC"/ "$DST"/; then
            echo "[OK] Backup complete for \"$SRC\""
            return
        else
            echo "[WARN] Retry $attempt failed for \"$SRC\". Waiting 3s..."
            sleep 3
        fi
    done

    echo "[ERROR] Something went wrong while copying \"$SRC\""
}

########################################
# Folder Pairs (source → destination)
########################################
backup ~/Documents/Backup   "$DEST/Backup"
backup ~/Documents/Security "$DEST/Security"
backup ~/Documents/Obsidian "$DEST/Obsidian"
backup ~/Documents/Books    "$DEST/Books"
backup ~/Documents/UNEC     "$DEST/UNEC"
backup ~/Music/Personal     "$DEST/Personal"
backup ~/Pictures           "$DEST/Pictures"

echo ""
echo "Backup finished."
