#!/bin/bash

original="$HOME/sync/Database.kdbx"
copy2="$HOME/Documents/Database.kdbx"
copy1="$HOME/Nextcloud/Database.kdbx"

while true; do
    inotifywait -e modify "$original"
    rsync -av "$original" "$copy1"
    rsync -av "$original" "$copy2"
done
