#!/bin/bash

# FouadOSINT - Quick Image Update Script
# Run this to update all screenshots with watermarks

clear

echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║           🔍 FouadOSINT Image Update Tool                       ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
echo "This script will add 'fouadosint' watermarks to your screenshots"
echo ""

# Check if we're in the right directory
if [ ! -d "images" ]; then
    echo "❌ Error: images/ directory not found"
    echo "Please run this from: /home/kali/Desktop/osin/infoooze/"
    exit 1
fi

echo "📂 Found images directory"
echo ""

# Check for Python and Pillow
echo "🔍 Checking dependencies..."
if command -v python3 &> /dev/null; then
    echo "✅ Python3 is installed"
    
    # Try to import PIL
    python3 -c "from PIL import Image" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✅ Pillow (PIL) is installed"
        echo ""
        echo "🚀 Running Python watermark script..."
        echo ""
        python3 watermark_images.py
        exit 0
    else
        echo "⚠️  Pillow not installed, installing..."
        pip3 install Pillow --user
        echo ""
        echo "🚀 Running Python watermark script..."
        echo ""
        python3 watermark_images.py
        exit 0
    fi
fi

# Fallback to ImageMagick
if command -v convert &> /dev/null; then
    echo "✅ ImageMagick is installed"
    echo ""
    echo "🚀 Running ImageMagick watermark script..."
    echo ""
    bash update_images.sh
    exit 0
fi

# Neither available
echo "❌ Neither Python3 nor ImageMagick found"
echo ""
echo "Please install one of them:"
echo ""
echo "For Python:"
echo "  sudo apt-get install python3 python3-pip"
echo "  pip3 install Pillow"
echo ""
echo "For ImageMagick:"
echo "  sudo apt-get install imagemagick"
echo ""
echo "Then run this script again."
