# 🎨 Image Update Guide for FouadOSINT

## 📸 Images That Need Updating

All images in the `/images/` directory need to be updated with "fouadosint" branding.

### Current Images:
```
images/
├── logo-main.png       (14.2 KB)
├── logo-light.jpg      (14.4 KB)
├── screenshot1.png     (41.3 KB)
├── screenshot2.png     (24.6 KB)
├── screenshot3.png     (11.1 KB)
├── screenshot4.png     (23.2 KB)
└── screenshot5.png     (54.5 KB)
```

---

## 🎨 Design Guidelines

### Color Palette
Use these exact colors for consistency:

- **Primary Cyan:** `#00D9FF`
- **Yellow Gold:** `#FFD93D`
- **Purple Accent:** `#6C63FF`
- **Coral Red:** `#FF6B6B`
- **Success Green:** `#51CF66`
- **Neutral Gray:** `#999999`

### Typography
- **Font Recommendations:**
  - Primary: **Montserrat Bold** or **Roboto Bold**
  - Secondary: **Inter** or **Source Sans Pro**
  - Mono: **JetBrains Mono** or **Fira Code**

### Logo Design
- Remove all "Infoooze" or "infooze" text
- Add "fouadosint" in modern, bold typography
- Include 🔍 emoji or icon for OSINT theme
- Use gradient effects with the color palette
- Maintain transparency (PNG format)

---

## 🖼️ Image Update Instructions

### **Option 1: Using Online Tools (Easiest)**

#### **Canva (Recommended)**
1. Go to [canva.com](https://www.canva.com)
2. Create account (free)
3. Upload your images
4. Use "Text" tool to add "fouadosint"
5. Apply color scheme
6. Download as PNG

#### **Photopea (Free Photoshop Alternative)**
1. Go to [photopea.com](https://www.photopea.com)
2. Open image
3. Use text tool to remove old text
4. Add "fouadosint" with custom styling
5. Export as PNG

### **Option 2: Using GIMP (Free Desktop Software)**

```bash
# Install GIMP on Linux
sudo apt-get install gimp

# Launch GIMP
gimp
```

**Steps:**
1. Open image in GIMP
2. Use "Clone Tool" or "Healing Tool" to remove old text
3. Add text layer with "fouadosint"
4. Apply colors from palette
5. Export as PNG with transparency

### **Option 3: Using ImageMagick (Command Line)**

```bash
# Install ImageMagick
sudo apt-get install imagemagick

# Add watermark to screenshot (example)
convert images/screenshot1.png \
  -pointsize 40 \
  -fill '#00D9FF' \
  -gravity southeast \
  -annotate +20+20 'fouadosint' \
  images/screenshot1_new.png
```

---

## 📝 Specific Updates for Each Image

### **1. logo-main.png**
- **Current:** Contains "Infoooze" text
- **Update:** Replace with "FOUADOSINT" in bold caps
- **Style:** Modern gradient (Cyan → Purple)
- **Size:** Keep at ~135px height
- **Background:** Transparent

### **2. logo-light.jpg**
- **Current:** Light theme logo
- **Update:** Replace with "fouadosint" 
- **Style:** Clean, minimalist
- **Convert:** Change to PNG for transparency

### **3-7. Screenshots (screenshot1-5.png)**
- **Current:** Terminal screenshots with old branding
- **Update:** Add watermark/overlay
- **Position:** Bottom-right corner
- **Text:** "fouadosint" with 🔍 icon
- **Opacity:** 70-80% for subtle effect
- **Alternative:** Re-take screenshots after installing updated tool

---

## 🚀 Quick Terminal Screenshot Method

**Best Option:** Take new screenshots after the tool is fully rebranded!

```bash
# 1. Install the rebranded tool locally
cd /home/kali/Desktop/osin/infoooze
npm install -g .

# 2. Run the tool
fouadosint

# 3. Use screenshot tool (Linux)
# Press PrtScn or use:
gnome-screenshot -i

# Or use flameshot (better for annotations)
sudo apt-get install flameshot
flameshot gui
```

**Take screenshots of:**
1. Main menu interface
2. Instagram reconnaissance results
3. Subdomain scanner in action
4. Port scanning output
5. Full terminal view with multiple tools

---

## 🎯 Watermark Template

If adding watermarks to existing screenshots, use this layout:

```
Position: Bottom-right corner
Padding: 20px from edges
Background: Semi-transparent dark overlay
Text: "fouadosint" 
Icon: 🔍 or custom logo
Font Size: 32-40px
Color: #00D9FF or #FFD93D
Opacity: 75%
```

---

## 🔧 Automated Batch Processing Script

Create this script to add watermarks to all screenshots at once:

```bash
#!/bin/bash
# Save as: watermark_images.sh

cd images

for img in screenshot*.png; do
    convert "$img" \
        -pointsize 36 \
        -fill '#00D9FF' \
        -gravity southeast \
        -annotate +30+30 '🔍 fouadosint' \
        "new_$img"
    echo "Processed: $img"
done

echo "✅ All screenshots watermarked!"
```

**Run it:**
```bash
chmod +x watermark_images.sh
./watermark_images.sh
```

---

## ✅ Verification Checklist

After updating images, verify:

- [ ] All images open correctly
- [ ] No references to "Infoooze" visible
- [ ] "fouadosint" is clearly readable
- [ ] Colors match the official palette
- [ ] PNG files have transparency
- [ ] File sizes are reasonable (<100KB for screenshots)
- [ ] Images display correctly in README.md
- [ ] GitHub preview shows updated images

---

## 📤 After Updating Images

```bash
# Commit changes
cd /home/kali/Desktop/osin/infoooze
git add images/
git commit -m "🎨 Update images with FouadOSINT branding"
git push
```

---

## 🆘 Need Help?

If you're not comfortable with image editing:

### **Hire a Designer:**
- **Fiverr:** Logo design from $5-25
- **Upwork:** Professional designers
- **99designs:** Logo contests

### **Free Alternatives:**
- Use text-only README (remove image references temporarily)
- Keep current images and update gradually
- Ask the community for contributions

---

## 💡 Pro Tips

1. **Keep Original Images:** Backup originals before editing
2. **Use Vectors:** Create logo in SVG for scalability
3. **Consistent Style:** Use same font across all images
4. **High Quality:** Export at 2x resolution for Retina displays
5. **Compress:** Use [TinyPNG](https://tinypng.com) to reduce file sizes
6. **Git LFS:** For large images, consider Git Large File Storage

---

**Made with ❤️ by Fouad Zalaf**

🔍 FouadOSINT - Advanced OSINT Framework
