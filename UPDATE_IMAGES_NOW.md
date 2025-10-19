# 🎨 Update Images to FouadOSINT - Quick Guide

## 📁 Your Images Directory
Location: `/home/kali/Desktop/osin/infoooze/images/`

**7 files to update:**
- logo-main.png (Logo - needs manual edit)
- logo-light.jpg (Logo - needs manual edit)  
- screenshot1.png (Add watermark)
- screenshot2.png (Add watermark)
- screenshot3.png (Add watermark)
- screenshot4.png (Add watermark)
- screenshot5.png (Add watermark)

---

## 🚀 OPTION 1: Automatic Watermarking (Recommended)

### Run Python Script
```bash
cd /home/kali/Desktop/osin/infoooze
python3 watermark_images.py
```

This will:
- ✅ Backup originals to `images/backup/`
- ✅ Add "🔍 fouadosint" watermark to all screenshots
- ✅ Create new files with `_new` suffix

### Or Run Bash Script
```bash
cd /home/kali/Desktop/osin/infoooze
bash update_images.sh
```

---

## 🎨 OPTION 2: Manual Watermarking with ImageMagick

### Install ImageMagick (if needed)
```bash
sudo apt-get update
sudo apt-get install imagemagick -y
```

### Add Watermarks to Screenshots
```bash
cd /home/kali/Desktop/osin/infoooze/images

# Backup originals first
mkdir -p backup
cp *.png *.jpg backup/

# Add watermark to each screenshot
convert screenshot1.png \
  -gravity SouthEast \
  -pointsize 36 \
  -fill '#00D9FF' \
  -annotate +30+30 '🔍 fouadosint' \
  screenshot1_new.png

# Repeat for screenshot2-5.png
convert screenshot2.png -gravity SouthEast -pointsize 36 -fill '#00D9FF' -annotate +30+30 '🔍 fouadosint' screenshot2_new.png
convert screenshot3.png -gravity SouthEast -pointsize 36 -fill '#00D9FF' -annotate +30+30 '🔍 fouadosint' screenshot3_new.png
convert screenshot4.png -gravity SouthEast -pointsize 36 -fill '#00D9FF' -annotate +30+30 '🔍 fouadosint' screenshot4_new.png
convert screenshot5.png -gravity SouthEast -pointsize 36 -fill '#00D9FF' -annotate +30+30 '🔍 fouadosint' screenshot5_new.png

# Replace originals
mv screenshot1_new.png screenshot1.png
mv screenshot2_new.png screenshot2.png
mv screenshot3_new.png screenshot3.png
mv screenshot4_new.png screenshot4.png
mv screenshot5_new.png screenshot5.png
```

---

## 🖼️ OPTION 3: Take Fresh Screenshots (Best Quality)

Since the tool is now rebranded, take new screenshots:

```bash
# Install the rebranded tool
cd /home/kali/Desktop/osin/infoooze
npm install -g .

# Launch the tool
fouadosint

# Take screenshots with your favorite tool:
flameshot gui
# or
gnome-screenshot -i
# or just press PrtScn

# Save new screenshots to images/ folder
# Name them: screenshot1.png through screenshot5.png
```

**What to capture:**
1. Main menu with FOUADOSINT banner
2. Instagram reconnaissance in action
3. Subdomain scanner results
4. Port scanning output
5. Full terminal with multiple features

---

## 🎨 LOGOS - MUST BE MANUALLY EDITED

### For logo-main.png and logo-light.jpg:

#### Option A: Online Tools (Easiest)

**1. Canva (Recommended)**
1. Go to https://www.canva.com
2. Create free account
3. Upload logo-main.png
4. Remove/edit "Infoooze" text
5. Add "fouadosint" text
6. Use colors:
   - Cyan: #00D9FF
   - Yellow: #FFD93D
7. Download as PNG

**2. Photopea (Free Photoshop)**
1. Go to https://www.photopea.com
2. Open logo-main.png
3. Use healing/clone tool to remove old text
4. Add text: "fouadosint"
5. Apply modern font (Montserrat Bold or similar)
6. Export as PNG

#### Option B: GIMP (Desktop)

```bash
# Install GIMP
sudo apt-get install gimp -y

# Open GIMP
gimp images/logo-main.png

# Edit the logo:
# 1. Use Clone Tool to remove "Infoooze"
# 2. Add text layer with "fouadosint"
# 3. Apply cyan gradient (#00D9FF)
# 4. Export as PNG
```

#### Option C: Create New Logo

Use these text designs:

**Style 1: Simple Text**
```
fouadosint
🔍 Advanced OSINT Framework
```

**Style 2: Modern**
```
FOUADOSINT
━━━━━━━━━━━━━━━━
🔍 Professional Intelligence Tool
```

**Style 3: Badge Style**
```
╔═══════════════╗
║  FOUADOSINT   ║
║      🔍        ║
╚═══════════════╝
```

---

## ✅ Verification Checklist

After updating:
- [ ] All screenshots have "fouadosint" watermark
- [ ] No "Infoooze" text visible anywhere
- [ ] Logos show "fouadosint" or new design
- [ ] Colors match theme (Cyan #00D9FF, Yellow #FFD93D)
- [ ] Files are PNG format (with transparency)
- [ ] README.md displays images correctly

---

## 🔄 Quick Commands Summary

```bash
# Go to project directory
cd /home/kali/Desktop/osin/infoooze

# Method 1: Run Python script
python3 watermark_images.py

# Method 2: Run bash script  
bash update_images.sh

# Method 3: Manual ImageMagick
cd images
for i in {1..5}; do
  convert screenshot${i}.png -gravity SouthEast -pointsize 36 \
    -fill '#00D9FF' -annotate +30+30 '🔍 fouadosint' \
    screenshot${i}_new.png
done

# Method 4: Take fresh screenshots
npm install -g . && fouadosint
# Then use screenshot tool

# For logos: Use online tools or GIMP
firefox https://www.canva.com
# or
firefox https://www.photopea.com
```

---

## 🆘 Need Help?

**Quick fixes:**

**Issue:** Scripts don't work
```bash
# Check Python/ImageMagick
python3 --version
convert --version

# Install if missing
sudo apt-get install python3-pip imagemagick
pip3 install Pillow
```

**Issue:** Permission denied
```bash
chmod +x watermark_images.py update_images.sh
```

**Issue:** Can't edit logos manually
- Use online tools (Canva/Photopea) - easiest!
- Or hire designer on Fiverr ($5-25)
- Or create simple text-based logo

---

## 📧 Contact

**Fouad Zalaf**
- Email: zalaffouad37@gmail.com
- Instagram: @1.pvl, @fod1v

---

## 🎯 After Images Are Updated

```bash
# Commit changes
git add images/
git commit -m "🎨 Update all images with FouadOSINT branding"
git push

# Test locally
npm install -g .
fouadosint
```

---

**Your images are the face of FouadOSINT - make them look professional! 🔍✨**
