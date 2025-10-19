#!/bin/bash

# FouadOSINT Image Update Script
# This script adds "fouadosint" watermarks to screenshots

echo "╔══════════════════════════════════════════════════════════╗"
echo "║       FouadOSINT Image Watermark Tool                   ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "⚠️  ImageMagick not found. Installing..."
    sudo apt-get update
    sudo apt-get install -y imagemagick
fi

# Create backup directory
echo "📁 Creating backup directory..."
mkdir -p images/backup
cp images/*.png images/backup/ 2>/dev/null
cp images/*.jpg images/backup/ 2>/dev/null
echo "✅ Backup created in images/backup/"
echo ""

# Color for watermark
COLOR="#00D9FF"

# Add watermark to screenshots
echo "🎨 Adding watermarks to screenshots..."
echo ""

for i in 1 2 3 4 5; do
    input="images/screenshot${i}.png"
    output="images/screenshot${i}_watermarked.png"
    
    if [ -f "$input" ]; then
        echo "  Processing screenshot${i}.png..."
        
        # Add watermark with ImageMagick
        convert "$input" \
            -gravity SouthEast \
            -pointsize 36 \
            -fill "$COLOR" \
            -annotate +30+30 "🔍 fouadosint" \
            "$output"
        
        if [ $? -eq 0 ]; then
            echo "  ✅ Created: screenshot${i}_watermarked.png"
        else
            echo "  ❌ Failed: screenshot${i}.png"
        fi
    fi
done

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║  Watermarked screenshots created!                        ║"
echo "║                                                          ║"
echo "║  Files created:                                          ║"
echo "║  • images/screenshot1_watermarked.png                    ║"
echo "║  • images/screenshot2_watermarked.png                    ║"
echo "║  • images/screenshot3_watermarked.png                    ║"
echo "║  • images/screenshot4_watermarked.png                    ║"
echo "║  • images/screenshot5_watermarked.png                    ║"
echo "║                                                          ║"
echo "║  Original files backed up to: images/backup/             ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
echo "⚠️  IMPORTANT: Logo files need manual editing!"
echo "   • images/logo-main.png"
echo "   • images/logo-light.jpg"
echo ""
echo "📖 See IMAGE_UPDATE_GUIDE.md for logo editing instructions"
echo ""
echo "🔄 To replace originals with watermarked versions:"
echo "   mv images/screenshot*_watermarked.png images/"
echo "   rename 's/_watermarked//' images/screenshot*.png"
echo ""
