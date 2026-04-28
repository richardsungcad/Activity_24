# Richard Tools Hub - Complete Windows Installation Guide

## 📋 Table of Contents
1. [Prerequisites Installation](#prerequisites-installation)
2. [Environment Setup](#environment-setup)
3. [Project Setup](#project-setup)
4. [Building APK](#building-apk)
5. [Troubleshooting](#troubleshooting)

---

## Prerequisites Installation

### Step 1: Install Node.js

1. Download Node.js from https://nodejs.org/
   - Choose "LTS" version (recommended)
   
2. Run the installer
   - Accept license agreement
   - Choose default installation path: `C:\Program Files\nodejs\`
   - Select "Add to PATH" (important!)
   - Accept all settings
   
3. Verify installation:
   ```bash
   node --version
   npm --version
   ```
   
   Should show version numbers (e.g., v14.17.0, 7.20.0)

---

### Step 2: Install Java SDK

1. Download Java SE Development Kit from:
   https://www.oracle.com/java/technologies/javase-downloads.html
   
   - Choose Java SE 8u341 (Long-term support)
   - Download "jdk-8u341-windows-x64.exe"
   
2. Run installer
   - Accept license
   - Install to: `C:\Program Files\Java\jdk1.8.0_341\`
   - Proceed with installation

3. Verify installation:
   ```bash
   java -version
   javac -version
   ```

---

### Step 3: Install Android SDK

1. Download Android Studio from:
   https://developer.android.com/studio
   
2. Run Android Studio installer
   - Accept terms
   - Choose installation type: "Standard"
   - Accept all components and paths
   - Click "Finish"
   
3. First Launch Setup:
   - Android Studio will ask to download SDK
   - Choose "Don't Import Settings"
   - Select "Standard" setup
   - SDK will install at: `C:\Users\YourUsername\AppData\Local\Android\Sdk`
   
4. Download Additional Components:
   - Open Android Studio
   - Go to: Configure → SDK Manager
   - Install:
     ✓ Android SDK Platform 21 or higher
     ✓ Google USB Driver
     ✓ Android Emulator
     ✓ Intel HAXM (for emulation)

---

## Environment Setup

### Step 1: Set Environment Variables

**For Windows 10/11:**

1. Open Start Menu, search for: **"Environment Variables"**
2. Click: **"Edit the system environment variables"**
3. Click button: **"Environment Variables..."** (bottom right)
4. Under "System variables", click: **"New..."**

**Add JAVA_HOME:**
- Variable name: `JAVA_HOME`
- Variable value: `C:\Program Files\Java\jdk1.8.0_341`
- Click OK

**Add ANDROID_SDK_ROOT:**
- Variable name: `ANDROID_SDK_ROOT`
- Variable value: `C:\Users\YourUsername\AppData\Local\Android\Sdk`
  (Replace "YourUsername" with your Windows username)
- Click OK

**Verify PATH includes Node.js:**
- In "System variables", find and select: `Path`
- Click "Edit..."
- Should include: `C:\Program Files\nodejs\`
- If not, click "New" and add it

5. Click "OK" on all dialogs
6. **Restart Command Prompt** for changes to take effect

### Step 2: Verify Environment Variables

Open new Command Prompt and run:

```bash
# Check Java
java -version
javac -version

# Check Node.js
node --version
npm --version

# Check Android SDK path
echo %ANDROID_SDK_ROOT%
echo %JAVA_HOME%
```

All should return version numbers or paths without errors.

---

## Project Setup

### Step 1: Install Cordova CLI

Open Command Prompt and run:

```bash
npm install -g cordova
```

Verify:
```bash
cordova --version
```

Should show version (e.g., 11.0.0)

### Step 2: Navigate to Project

```bash
cd C:\MAMP\htdocs\IndexedBD\RichardToolsHub
```

### Step 3: Install Project Dependencies

```bash
npm install
```

This will create `node_modules` folder and install required packages.

### Step 4: Add Android Platform

```bash
cordova platform add android
```

This will download and configure Android platform for Cordova.
Wait for completion (may take 5+ minutes on first run).

### Step 5: Add Required Plugins

Run these one by one:

```bash
cordova plugin add cordova-plugin-camera
cordova plugin add cordova-plugin-file
cordova plugin add cordova-plugin-file-transfer
cordova plugin add cordova-plugin-splashscreen
cordova plugin add cordova-plugin-dialogs
cordova plugin add cordova-plugin-whitelist
```

---

## Building APK

### Option 1: Automated Build (Recommended)

```bash
cd C:\MAMP\htdocs\IndexedBD\RichardToolsHub
build.bat
```

The batch file will:
1. Verify requirements
2. Install dependencies
3. Add platform
4. Add plugins
5. Build APK
6. Show completion message with APK location

**Total time: 10-20 minutes (first build)**

### Option 2: Manual Build

Debug APK (for testing):
```bash
cd C:\MAMP\htdocs\IndexedBD\RichardToolsHub
cordova build android
```

Release APK (for app store):
```bash
cordova build android --release
```

---

### Monitoring Build Progress

During build, you'll see:
```
Running on: 28 virtual devices in parallel
Building APK...
Building plugin: cordova-plugin-camera...
Building plugin: cordova-plugin-file...
...
[INFO] Build successful!
```

This is normal. Build time:
- First build: 10-20 minutes
- Rebuild: 2-5 minutes
- Incremental: 30 seconds

---

### Finding Your APK

After successful build, locate APK at:

**Debug APK:**
```
C:\MAMP\htdocs\IndexedBD\RichardToolsHub\platforms\android\app\build\outputs\apk\debug\
└── app-debug.apk
```

**Release APK:**
```
C:\MAMP\htdocs\IndexedBD\RichardToolsHub\platforms\android\app\build\outputs\apk\release\
└── app-release-unsigned.apk
```

---

## Installation on Device

### Method 1: Via USB Cable (Recommended)

**Prepare Device:**
1. Connect Android phone via USB
2. Go to Settings → Developer Options
   - If not visible: Settings → About Phone → Tap "Build Number" 7 times
3. Enable "USB Debugging"
4. Allow device authorization on phone

**Deploy App:**
```bash
cd C:\MAMP\htdocs\IndexedBD\RichardToolsHub
cordova run android
```

App will auto-install and launch.

### Method 2: Manual Installation

1. Copy APK file to phone (via USB cable):
   - Connect phone
   - Find "app-debug.apk" in file explorer
   - Right-click → Send To → Mobile Device

2. On phone:
   - Open File Manager
   - Find "app-debug.apk"
   - Tap file
   - Allow "Installation from Unknown Sources" if prompted
   - Tap "Install"
   - Wait for completion
   - Click "Open" to launch

### Method 3: Using Android Emulator

```bash
# List available emulators
emulator -list-avds

# Start emulator (replace 'Pixel_4_API_30' with your emulator name)
emulator -avd Pixel_4_API_30

# Wait for emulator to fully load, then run:
cordova run android
```

---

## Troubleshooting

### Build Fails With: "JAVA_HOME is not set"

**Solution:**
```bash
# Set temporary JAVA_HOME
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_341
cordova build android

# Or set permanently via Environment Variables
# (See Step 1 of Environment Setup)
```

### Build Fails With: "ANDROID_SDK_ROOT is not set"

**Solution:**
```bash
# Set temporary ANDROID_SDK_ROOT
set ANDROID_SDK_ROOT=C:\Users\YourUsername\AppData\Local\Android\Sdk
cordova build android

# Or set permanently via Environment Variables
```

### Build Fails With: "Could not find gradle"

**Solution:**
```bash
# Clean and rebuild
cordova clean
cordova platform remove android
cordova platform add android
cordova build android
```

### Build Fails With: "Plugin X not found"

**Solution:**
```bash
cordova plugin remove cordova-plugin-X
cordova plugin add cordova-plugin-X
```

### "Cannot find module" errors

**Solution:**
```bash
# Clear node_modules and reinstall
rmdir node_modules /s /q
npm install
cordova build android
```

### APK Won't Install: "App not installed"

**Solutions:**
- Device architecture mismatch: Rebuild with matching architecture
- Android version too old: Device needs Android 5.0+ (SDK 19+)
- Storage space: Free up phone storage
- Delete conflicting app version: Uninstall previous app first

### APK Installs But Won't Launch

**Solutions:**
1. Check device logs:
   ```bash
   adb logcat | grep "Richards Toop"
   ```

2. Check console in Chrome:
   - Connect device via USB
   - Open Chrome
   - Go to: chrome://inspect
   - Click "Inspect" under your device
   - Check Console tab for errors

3. Clear app data:
   - Device Settings → Apps → Richard Tools Hub → Storage → Clear Cache
   - Uninstall and reinstall

### Device Not Recognized

**Solution:**
1. Install USB drivers:
   - Open Android Studio
   - Configure → SDK Manager → SDK Tools
   - Check "Google USB Driver"
   - Install

2. Restart ADB:
   ```bash
   adb kill-server
   adb start-server
   ```

3. Restart USB debugging:
   - Device Settings → Developer Options → Toggle USB Debugging OFF then ON
   - Reconnect USB cable

### Build Takes Too Long

**Normal:**
- First build: 10-20 minutes (downloads SDK, plugins, etc.)
- Subsequent: 2-5 minutes
- This is expected behavior

**To Speed Up:**
- Use `cordova run android` for development (faster)
- Use `cordova build android` for release builds

---

## Verification Checklist

✓ Node.js installed and in PATH
✓ Java SDK installed and JAVA_HOME set
✓ Android SDK installed and ANDROID_SDK_ROOT set
✓ Cordova CLI installed
✓ Project dependencies installed (npm install)
✓ Android platform added (cordova platform add android)
✓ Plugins installed
✓ APK built successfully
✓ APK file found in expected location
✓ APK size > 5MB
✓ App installs on device
✓ App launches without errors
✓ Can login/register
✓ Can add products
✓ Search works
✓ Profile uploads image

---

## Quick Reference Commands

```bash
# Navigate to project
cd C:\MAMP\htdocs\IndexedBD\RichardToolsHub

# Check Cordova version
cordova --version

# Check plugins
cordova plugin list

# Check platforms
cordova platform list

# Full rebuild
cordova clean
cordova platform remove android
cordova platform add android
cordova build android

# Build and deploy to device
cordova run android --verbose

# Check connected devices
adb devices

# View device logs
adb logcat

# Build release APK
cordova build android --release
```

---

## Support

For additional help:
1. Check README.md for detailed documentation
2. Review APP_FLOW.md for application architecture
3. Check QUICKSTART.txt for quick reference
4. Visit Apache Cordova docs: https://cordova.apache.org/

---

**Last Updated:** April 12, 2026
**Windows Version:** 10/11
**Java Version:** 8 or higher
**Android Version:** 5.0+ (SDK 19+)
