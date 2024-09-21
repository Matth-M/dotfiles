#!/bin/bash
# Copy Keepass database to Nextcloud and Documents from sync

original="$HOME/sync/Database.kdbx"
copy2="$HOME/Documents/Database.kdbx"
copy1="$HOME/Nextcloud/Database.kdbx"

rsync -a "$original" "$copy1"
rsync -a "$original" "$copy2"
