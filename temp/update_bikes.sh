#!/bin/bash

# Process 250F bikes
for bikedir in mods/bikes/*/; do
  if [[ $bikedir == *"250F"* && $bikedir != *"Stark Varg"* ]]; then
    echo "Processing 250F bike: $bikedir"
    
    # Get bike name from directory
    bikename=$(basename "$bikedir")
    
    # Copy new engine files
    cp temp/250F/new_stock.engn "$bikedir/stock.engn"
    cp temp/250F/new_race.engn "$bikedir/race.engn"
    
    # Find the cfg file
    cfg_file="$bikedir/$bikename.cfg"
    
    # Update masses using temporary files
    awk '
    BEGIN { in_chassis=0; in_steer=0; in_front_suspension=0; in_rear_suspension=0; }
    
    /chassis/ { in_chassis=1; }
    /steer/ { in_steer=1; }
    /front_suspension/ { in_front_suspension=1; }
    /rear_suspension/ { in_rear_suspension=1; }
    
    /^}/ { in_chassis=0; in_steer=0; in_front_suspension=0; in_rear_suspension=0; }
    
    {
      if (in_chassis && $1 == "Mass") {
        mass = $3;
        printf "\tMass = %.2f\n", mass * 0.92;
      }
      else if ((in_steer || in_front_suspension || in_rear_suspension) && $1 == "Mass") {
        mass = $3;
        printf "\tMass = %.2f\n", mass * 0.95;
      }
      else {
        print $0;
      }
    }
    ' "$cfg_file" > "$cfg_file.tmp"
    
    mv "$cfg_file.tmp" "$cfg_file"
  fi
done

# Process 450F bikes
for bikedir in mods/bikes/*/; do
  if [[ $bikedir == *"450F"* && $bikedir != *"Stark Varg"* ]]; then
    echo "Processing 450F bike: $bikedir"
    
    # Get bike name from directory
    bikename=$(basename "$bikedir")
    
    # Copy new engine files
    cp temp/450F/new_stock.engn "$bikedir/stock.engn"
    cp temp/450F/new_race.engn "$bikedir/race.engn"
    
    # Find the cfg file
    cfg_file="$bikedir/$bikename.cfg"
    
    # Update masses using temporary files
    awk '
    BEGIN { in_chassis=0; in_steer=0; in_front_suspension=0; in_rear_suspension=0; }
    
    /chassis/ { in_chassis=1; }
    /steer/ { in_steer=1; }
    /front_suspension/ { in_front_suspension=1; }
    /rear_suspension/ { in_rear_suspension=1; }
    
    /^}/ { in_chassis=0; in_steer=0; in_front_suspension=0; in_rear_suspension=0; }
    
    {
      if (in_chassis && $1 == "Mass") {
        mass = $3;
        printf "\tMass = %.2f\n", mass * 0.92;
      }
      else if ((in_steer || in_front_suspension || in_rear_suspension) && $1 == "Mass") {
        mass = $3;
        printf "\tMass = %.2f\n", mass * 0.95;
      }
      else {
        print $0;
      }
    }
    ' "$cfg_file" > "$cfg_file.tmp"
    
    mv "$cfg_file.tmp" "$cfg_file"
  fi
done

echo "All bikes updated successfully!"