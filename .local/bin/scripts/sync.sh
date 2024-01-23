#!/bin/bash

# Set your paths
original="$HOME/Nextcloud/Database.kdbx"
syncthing_copy="$HOME/sync/Database.kdbx"

while true; do
    inotifywait -e modify "$original"
    rsync -av "$original" "$syncthing_copy"
done
