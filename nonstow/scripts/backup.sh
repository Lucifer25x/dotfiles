#!/usr/bin/env bash

set -euo pipefail

DEST=$(findmnt -rn -S LABEL=BACKUP_USB -o TARGET)
if [[ -z "$DEST" ]]; then
    echo "[ERROR] BACKUP_USB is not mounted. Aborting."
    exit 1
fi

if ! touch "$DEST/.write_test" 2>/dev/null; then
    echo "[ERROR] BACKUP_USB is mounted read-only. Run: sudo dosfsck -a /dev/sda1"
    exit 1
fi
rm -f "$DEST/.write_test"

########################################
# Backup Function (source → destination)
########################################
backup() {
    local SRC="$1"
    local DST="$2"

    echo ""
    echo "Checking \"$SRC\" → \"$DST\""

    mkdir -p "$DST"

    for attempt in 1 2; do
        # if rsync -aru --info=progress2 "$SRC"/ "$DST"/; then
        if rsync -rtu --no-perms --no-owner --no-group --info=progress2 "$SRC"/ "$DST"/; then
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
