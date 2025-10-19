#!/usr/bin/env python3
"""
FouadOSINT Image Watermark Tool
Adds "fouadosint" watermarks to screenshot images
"""

import os
import sys
from pathlib import Path

try:
    from PIL import Image, ImageDraw, ImageFont
except ImportError:
    print("❌ Pillow not installed. Installing...")
    os.system("pip3 install Pillow")
    from PIL import Image, ImageDraw, ImageFont

# Configuration
WATERMARK_TEXT = "🔍 fouadosint"
WATERMARK_COLOR = (0, 217, 255)  # Cyan #00D9FF
OPACITY = 200  # 0-255
POSITION = "bottom-right"
PADDING = 30
FONT_SIZE = 36

def add_watermark(input_path, output_path):
    """Add watermark to an image"""
    try:
        # Open image
        img = Image.open(input_path)
        
        # Create drawing context
        draw = ImageDraw.Draw(img, 'RGBA')
        
        # Try to load a nice font
        try:
            font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", FONT_SIZE)
        except:
            font = ImageFont.load_default()
        
        # Get text size
        bbox = draw.textbbox((0, 0), WATERMARK_TEXT, font=font)
        text_width = bbox[2] - bbox[0]
        text_height = bbox[3] - bbox[1]
        
        # Calculate position
        width, height = img.size
        x = width - text_width - PADDING
        y = height - text_height - PADDING
        
        # Draw watermark with semi-transparency
        color_with_alpha = WATERMARK_COLOR + (OPACITY,)
        draw.text((x, y), WATERMARK_TEXT, font=font, fill=color_with_alpha)
        
        # Save
        img.save(output_path)
        return True
    except Exception as e:
        print(f"❌ Error processing {input_path}: {e}")
        return False

def main():
    print("╔══════════════════════════════════════════════════════════╗")
    print("║       FouadOSINT Image Watermark Tool (Python)          ║")
    print("╚══════════════════════════════════════════════════════════╝")
    print()
    
    # Create backup directory
    backup_dir = Path("images/backup")
    backup_dir.mkdir(exist_ok=True)
    print("📁 Backup directory: images/backup/")
    
    # Process screenshots
    images_dir = Path("images")
    processed = 0
    
    print("\n🎨 Processing screenshots...\n")
    
    for i in range(1, 6):
        input_file = images_dir / f"screenshot{i}.png"
        
        if input_file.exists():
            # Backup original
            backup_file = backup_dir / input_file.name
            if not backup_file.exists():
                import shutil
                shutil.copy2(input_file, backup_file)
            
            # Create watermarked version
            output_file = images_dir / f"screenshot{i}_new.png"
            
            print(f"  Processing screenshot{i}.png...")
            if add_watermark(input_file, output_file):
                print(f"  ✅ Created: screenshot{i}_new.png")
                processed += 1
            else:
                print(f"  ❌ Failed: screenshot{i}.png")
    
    print("\n╔══════════════════════════════════════════════════════════╗")
    print(f"║  ✅ Watermarked {processed} screenshots!                      ║")
    print("║                                                          ║")
    print("║  New files created with '_new' suffix                   ║")
    print("║  Originals backed up to: images/backup/                 ║")
    print("╚══════════════════════════════════════════════════════════╝")
    
    print("\n⚠️  LOGO FILES NEED MANUAL EDITING:")
    print("   • images/logo-main.png")
    print("   • images/logo-light.jpg")
    print("\n📖 See IMAGE_UPDATE_GUIDE.md for instructions")
    
    print("\n🔄 To replace originals with new versions:")
    print("   cd images")
    print("   mv screenshot1_new.png screenshot1.png")
    print("   # Repeat for all screenshots")

if __name__ == "__main__":
    main()
