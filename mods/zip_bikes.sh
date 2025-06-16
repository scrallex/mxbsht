#!/bin/bash

# Change to the main directory
cd bikes

# Loop through each folder in the bikes directory
for bike_folder in */; do
  # Remove trailing slash from folder name
  bike_name=${bike_folder%/}
  
  # Create zip file with the folder structure preserved correctly
  # The -j option would flatten the structure, so we don't use it
  # Instead, we run zip from within the bikes directory
  zip -r "../${bike_name}.zip" "${bike_name}"
  
  # Rename from .zip to .pkz
  cd ..
  mv "${bike_name}.zip" "${bike_name}.pkz"
  rm -rf "${bike_name}"
  mkdir -p "${bike_name}/paints" 

  echo "Created ${bike_name}.pkz"
  
  # Go back to bikes directory for next iteration
  cd bikes
done

# Return to original directory
cd ..

echo "All bike folders have been zipped with .pkz extension"