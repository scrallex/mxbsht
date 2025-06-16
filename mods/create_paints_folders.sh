#!/bin/bash

# Get list of bike names from the bikes directory
cd bikes
bike_folders=(*/);
cd ..

# Loop through each bike folder name
for bike_folder in "${bike_folders[@]}"; do
  # Remove trailing slash from folder name
  bike_name=${bike_folder%/}
  
  # Create a folder with the bike name (if it doesn't exist)
  mkdir -p "${bike_name}"
  
  # Create a "paints" subfolder inside the bike folder
  mkdir -p "${bike_name}/paints"
  
  echo "Created ${bike_name}/paints folder"
done

echo "All bike folders and paints subfolders have been created"