#!/bin/bash

# Define source and destination paths
sourcePath="$HOME/Zomboid/mods/VFEP93_UnofficialB41Finish"
destinationPath="../../Workshop/VFEP93_UnofficialB41Finish/Contents/mods/VFEP93_UnofficalB41Finish"

# Ensure the destination directory exists
mkdir -p "$destinationPath"

# Define the media folder path in the destination
destinationMediaPath="$destinationPath/media"

# Delete all files and subfolders inside the media folder of the workshop
if [ -d "$destinationMediaPath" ]; then
    rm -rf "$destinationMediaPath"/*
else
    echo "Media folder in the workshop does not exist. Skipping deletion."
fi

# Copy the media folder
cp -R "$sourcePath/media" "$destinationPath"

# Copy individual files (LICENSE, mod.info, poster.png)
for file in LICENSE mod.info poster.png; do
    filePath="$sourcePath/$file"
    if [ -f "$filePath" ]; then
        cp "$filePath" "$destinationPath"
    else
        echo "File not found: $filePath"
    fi
done

echo "Deployment completed successfully!"
