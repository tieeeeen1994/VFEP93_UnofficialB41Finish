# Define source and destination paths
$sourcePath = "c:\Users\Chen\Zomboid\mods\VFEP93_UnofficialB41Finish"
$destinationPath = "..\..\Workshop\VFEP93_UnofficialB41Finish\Contents\mods\VFEP93_UnofficalB41Finish"

# Ensure the destination directory exists
New-Item -ItemType Directory -Force -Path $destinationPath > $null 2>&1

# Copy the media folder
Copy-Item -Path "$sourcePath\media" -Destination $destinationPath -Recurse -Force > $null 2>&1

# Copy individual files (LICENSE, mod.info, poster.png)
$filesToCopy = @("LICENSE", "mod.info", "poster.png")
foreach ($file in $filesToCopy) {
    $filePath = Join-Path -Path $sourcePath -ChildPath $file
    if (Test-Path $filePath) {
        Copy-Item -Path $filePath -Destination $destinationPath -Force > $null 2>&1
    } else {
        Write-Host "File not found: $filePath"
    }
}

Write-Host "Copy to workshop completed successfully!"