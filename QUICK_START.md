# Quick Start - Get Your APK in 10 Minutes

## What's Included

✅ Complete Flutter radio player app with all features
✅ GitHub Actions workflow for automatic APK building
✅ Optimized for APK size under 30 MB
✅ Split APKs (~20-25 MB each)

## Fastest Way to Get APK (Using GitHub)

### Step 1: Create GitHub Repository (2 minutes)

1. Go to https://github.com/new
2. Repository name: `accessible-radio-player`
3. Make it **Public** (required for free builds)
4. Click "Create repository"

### Step 2: Upload Code (3 minutes)

**Option A: Using Git Command Line**
```bash
cd accessible_radio_player
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/accessible-radio-player.git
git branch -M main
git push -u origin main
```

**Option B: Using GitHub Web Interface**
1. Click "uploading an existing file" in your new repo
2. Drag ALL files from `accessible_radio_player` folder
3. Make sure `.github` folder is included
4. Click "Commit changes"

### Step 3: Wait for Build (5-10 minutes)

1. Go to "Actions" tab in your repository
2. Watch "Build Android APK" workflow run
3. Wait for green checkmark ✓

### Step 4: Download APK (1 minute)

1. Click on the completed workflow
2. Scroll to "Artifacts" section
3. Download **app-arm64-v8a-release** (for most phones)
4. Extract ZIP file to get the APK

## APK Sizes (All Under 30 MB!)

- **arm64-v8a**: ~20-25 MB (Most modern phones)
- **armeabi-v7a**: ~20-25 MB (Older phones)
- **x86_64**: ~20-25 MB (Rare devices)

## Which APK to Use?

- **Modern phones (2017+)**: Use `app-arm64-v8a-release.apk`
- **Older phones (2012-2017)**: Use `app-armeabi-v7a-release.apk`
- **Not sure?**: Try arm64 first, if it doesn't work, use armeabi

## Alternative: Build Locally (If You Have Flutter)

```bash
cd accessible_radio_player
flutter pub get
flutter build apk --release --split-per-abi
```

APK location: `build/app/outputs/flutter-apk/`

## Need Help?

- **GitHub build**: See `GITHUB_BUILD_GUIDE.md`
- **Local build**: See `BUILD_INSTRUCTIONS.md`
- **Using the app**: See `USER_GUIDE.md`

## Features Included

✅ Online radio streaming
✅ Add stations by URL
✅ Record radio streams
✅ Full accessibility (TTS, TalkBack support)
✅ Manage favorites
✅ View/delete recordings

---

**Total time: ~10 minutes to get your APK!** 🚀
