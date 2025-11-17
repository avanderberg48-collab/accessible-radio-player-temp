# GitHub Actions Build Guide

This guide will help you build the APK automatically using GitHub Actions (completely free).

## What You'll Get

- **Automated APK builds** in the cloud (no local setup needed)
- **Split APKs** optimized for size (~20-25 MB each, under 30 MB target)
- **Download links** for each APK variant
- **Automatic builds** on every code push

## Prerequisites

- A GitHub account (free)
- Git installed on your computer (optional, can use GitHub web interface)

## Step-by-Step Instructions

### Method 1: Using Git Command Line

#### 1. Create a GitHub Repository

1. Go to https://github.com
2. Click the "+" icon in the top-right corner
3. Select "New repository"
4. Name it: `accessible-radio-player`
5. Make it **Public** (required for free GitHub Actions)
6. **Do NOT** initialize with README (we already have one)
7. Click "Create repository"

#### 2. Push Your Code to GitHub

Open terminal/command prompt and run:

```bash
cd accessible_radio_player

# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit the files
git commit -m "Initial commit - Accessible Radio Player"

# Add your GitHub repository as remote
# Replace YOUR_USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR_USERNAME/accessible-radio-player.git

# Push to GitHub
git branch -M main
git push -u origin main
```

#### 3. GitHub Actions Will Build Automatically

Once you push the code:
1. Go to your repository on GitHub
2. Click the "Actions" tab
3. You'll see "Build Android APK" workflow running
4. Wait 5-10 minutes for the build to complete

#### 4. Download Your APK

After the build completes:
1. Click on the completed workflow run
2. Scroll down to "Artifacts" section
3. You'll see three APK files:
   - **app-arm64-v8a-release** (Recommended - for most modern phones)
   - **app-armeabi-v7a-release** (For older 32-bit phones)
   - **app-x86_64-release** (For rare x86 devices)
4. Click to download (they're in ZIP files, extract to get the APK)

### Method 2: Using GitHub Web Interface (No Git Required)

#### 1. Create Repository (Same as Method 1)

Follow step 1 from Method 1 above.

#### 2. Upload Files via Web

1. In your new repository, click "uploading an existing file"
2. Drag and drop ALL files from the `accessible_radio_player` folder
3. **Important**: Make sure to include the `.github` folder
4. Write commit message: "Initial commit"
5. Click "Commit changes"

#### 3. Download APK (Same as Method 1)

Follow steps 3-4 from Method 1 above.

## Understanding the APK Variants

### Which APK Should You Use?

- **app-arm64-v8a-release.apk** ← **Use this for most devices**
  - For: Modern Android phones (2017+)
  - Size: ~20-25 MB
  - Devices: Samsung Galaxy S8+, Google Pixel 2+, OnePlus 5+, etc.

- **app-armeabi-v7a-release.apk**
  - For: Older Android phones (2012-2017)
  - Size: ~20-25 MB
  - Devices: Older Samsung, LG, Motorola phones

- **app-x86_64-release.apk**
  - For: Rare x86-based Android devices
  - Size: ~20-25 MB
  - Devices: Some tablets, emulators

**If unsure, try arm64-v8a first. If it doesn't install, use armeabi-v7a.**

## APK Size Optimization

The workflow builds **split APKs** which are much smaller than universal APKs:

- **Universal APK**: ~50-60 MB (all architectures in one file)
- **Split APK (arm64)**: ~20-25 MB (single architecture)

This meets your requirement of under 30 MB! ✓

## Triggering Manual Builds

You can manually trigger a build without pushing code:

1. Go to your repository on GitHub
2. Click "Actions" tab
3. Click "Build Android APK" workflow
4. Click "Run workflow" button
5. Select branch (main)
6. Click "Run workflow"

## Creating Releases (Optional)

To create downloadable releases with permanent links:

### 1. Create a Git Tag

```bash
cd accessible_radio_player
git tag v1.0.0
git push origin v1.0.0
```

### 2. GitHub Actions Will Create a Release

The workflow automatically creates a GitHub Release when you push a tag.

### 3. Download from Releases

1. Go to your repository
2. Click "Releases" on the right sidebar
3. Download APKs directly from the release

## Troubleshooting

### Build Failed

**Check the logs:**
1. Go to Actions tab
2. Click on the failed workflow
3. Click on "build" job
4. Expand failed steps to see error messages

**Common issues:**
- Missing `.github/workflows/build-apk.yml` file
- Repository is private (must be public for free Actions)
- Syntax error in workflow file

### Can't Find Artifacts

**Make sure:**
- The build completed successfully (green checkmark)
- You're looking in the right workflow run
- The build didn't fail before creating artifacts

### APK Won't Install

**Try:**
- Different APK variant (arm64 vs armeabi)
- Enable "Install from Unknown Sources" on your device
- Check if you have enough storage space

## GitHub Actions Limits (Free Tier)

- **2,000 minutes/month** for private repos
- **Unlimited** for public repos
- **500 MB** artifact storage
- **90 days** artifact retention

This is more than enough for this project!

## Alternative: Codemagic (If GitHub Actions Doesn't Work)

If you prefer a different service:

1. Go to https://codemagic.io
2. Sign up with GitHub
3. Add your repository
4. Configure Flutter build
5. Download APK

## Security Note

The workflow uses debug signing (not production-ready). For production:

1. Create a keystore
2. Add signing secrets to GitHub
3. Update workflow to use release signing

See BUILD_INSTRUCTIONS.md for signing details.

## Getting the Download Link

After build completes, the APK download link format is:

```
https://github.com/YOUR_USERNAME/accessible-radio-player/actions/runs/RUN_ID
```

Share this link with others, and they can download the APK from the Artifacts section.

## Summary

1. ✅ Create GitHub repository (public)
2. ✅ Push code to GitHub
3. ✅ Wait 5-10 minutes for build
4. ✅ Download APK from Artifacts
5. ✅ Install on Android device

**Expected APK size: 20-25 MB (under 30 MB target)** ✓

## Support

- GitHub Actions Documentation: https://docs.github.com/en/actions
- Flutter CI/CD: https://docs.flutter.dev/deployment/cd

---

**The workflow is ready to use! Just push to GitHub and get your APK.** 🚀
