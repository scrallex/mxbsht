#!/bin/bash

# Configuration
MOD_NAME="MX_Bikes_Enhanced_Engines"
VERSION="1.0"
DIST_DIR="dist"
README_FILE="$DIST_DIR/README.txt"

# Create distribution directory
mkdir -p "$DIST_DIR"

# Create README file with instructions
cat > "$README_FILE" << EOF
MX Bikes Enhanced Engines v$VERSION
================================

This mod enhances all 250F and 450F bikes with:
- Improved engine performance (stock engines now use previous race specs)
- Enhanced new race engines with even better performance
- Reduced chassis mass by 8%
- Reduced steering mass by 5%
- Reduced suspension mass by 5%

Installation:
1. Copy the PKZ files to your MX Bikes mods folder:
   [Windows] C:\\Users\\[YourUsername]\\Documents\\MX Bikes\\Mods
   [Linux] ~/.local/share/MX Bikes/Mods
   [Mac] ~/Library/Application Support/MX Bikes/Mods

2. Start the game and enjoy the enhanced bikes!

Publishing:
- Upload to MX Bikes Mod Portal: https://mx-bikes.com/mods/
- Share on MX Bikes Discord: https://discord.gg/mxbikes
- Post on the MX Bikes Forums: https://forum.mx-bikes.com/

EOF

# Function to package a bike category
package_category() {
    local CATEGORY=$1
    local TEMP_DIR="temp_package/$CATEGORY"
    local PKZ_FILE="$DIST_DIR/${MOD_NAME}_${CATEGORY}_v${VERSION}.pkz"
    
    echo "Packaging $CATEGORY bikes..."
    mkdir -p "$TEMP_DIR/mods/bikes"
    
    # Copy only the modified files for each bike
    for bikedir in mods/bikes/*$CATEGORY*/; do
        if [[ $bikedir != *"Stark Varg"* ]]; then
            bikename=$(basename "$bikedir")
            echo "  - Including $bikename"
            
            # Create bike directory
            mkdir -p "$TEMP_DIR/$bikedir"
            
            # Copy engine files
            cp "$bikedir/stock.engn" "$TEMP_DIR/$bikedir/"
            cp "$bikedir/race.engn" "$TEMP_DIR/$bikedir/"
            
            # Copy and include cfg file in package
            cp "$bikedir/$bikename.cfg" "$TEMP_DIR/$bikedir/"
        fi
    done
    
    # Create PKZ file (which is just a zip file with a different extension)
    echo "Creating $PKZ_FILE..."
    (cd "$TEMP_DIR" && zip -r "../../$PKZ_FILE" .)
    
    # Clean up
    rm -rf "$TEMP_DIR"
    
    echo "Package for $CATEGORY created: $PKZ_FILE"
    echo ""
}

# Create a metadata file with mod information
cat > "$DIST_DIR/mod_info.json" << EOF
{
  "name": "$MOD_NAME",
  "version": "$VERSION",
  "author": "MX Bikes Modder",
  "description": "Enhanced engines and physics for all 250F and 450F bikes",
  "categories": ["Bikes", "Performance"],
  "tags": ["Engine", "Physics", "250F", "450F"],
  "compatibility": "Latest MX Bikes version"
}
EOF

# Package each category
package_category "250F"
package_category "450F"

# Create a combined package with both categories
COMBINED_PKZ="$DIST_DIR/${MOD_NAME}_All_v${VERSION}.pkz"
echo "Creating combined package..."
mkdir -p "temp_package/combined"
cp -r "$DIST_DIR"/*.pkz "temp_package/combined/"
(cd "temp_package/combined" && zip -r "../../$COMBINED_PKZ" .)
rm -rf "temp_package"

echo "----------------------------------------"
echo "Packaging complete!"
echo "All packages available in the '$DIST_DIR' directory"
echo ""
echo "To publish your mods:"
echo "1. Upload to MX Bikes Mod Portal: https://mx-bikes.com/mods/"
echo "2. Share on MX Bikes Discord: https://discord.gg/mxbikes"
echo "3. Post on the MX Bikes Forums: https://forum.mx-bikes.com/"
echo "----------------------------------------"