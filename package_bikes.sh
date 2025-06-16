#!/bin/bash

# Script to package MX Bikes mods
# Each folder is zipped with the folder inside the zip
# Then renamed from .zip to .pkz

# Change to the bikes directory
cd "$(dirname "$0")/mods/bikes" || exit 1

# Create a directory for the packaged files if it doesn't exist
mkdir -p "../../packaged_bikes"

# Process each folder in the bikes directory
for bike_folder in */; do
    # Remove trailing slash
    bike_name="${bike_folder%/}"
    
    echo "Packaging $bike_name..."
    
    # Create a temporary directory for zipping
    mkdir -p "../../temp_zip"
    
    # Copy the folder to the temporary directory
    cp -r "$bike_name" "../../temp_zip/"
    
    # Change to the temp directory and zip the folder
    cd "../../temp_zip" || exit 1
    zip -r "../packaged_bikes/$bike_name.zip" "$bike_name"
    
    # Rename from .zip to .pkz
    cd "../packaged_bikes" || exit 1
    mv "$bike_name.zip" "$bike_name.pkz"
    
    # Clean up temp directory
    cd ..
    rm -rf "temp_zip"
    
    # Return to bikes directory for next iteration
    cd "mods/bikes" || exit 1
    
    echo "Successfully packaged $bike_name.pkz"
done

echo "All bikes have been packaged into .pkz files in the packaged_bikes directory"