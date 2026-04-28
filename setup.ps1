# Setup Script for Richard Tools Hub
# This script prepares all necessary files and configurations

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "Richard Tools Hub - Project Setup" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

$projectRoot = Split-Path -Parent $PSScriptRoot
$profPicPath = "C:\MAMP\htdocs\IndexedBD\profpic.jpeg"
$projectPath = "C:\MAMP\htdocs\IndexedBD\RichardToolsHub"
$iconPath = "$projectPath\res\icon\android"
$screenPath = "$projectPath\res\screen\android"

# Check if profile picture exists
if (-not (Test-Path $profPicPath)) {
    Write-Host "ERROR: Profile picture not found at $profPicPath" -ForegroundColor Red
    exit 1
}

Write-Host "Profile picture found at: $profPicPath" -ForegroundColor Green
Write-Host ""

# Create necessary directories
Write-Host "Step 1: Creating directory structure..." -ForegroundColor Yellow
if (-not (Test-Path $iconPath)) {
    New-Item -Path $iconPath -ItemType Directory -Force | Out-Null
    Write-Host "  ✓ Created icon directory" -ForegroundColor Green
}

if (-not (Test-Path $screenPath)) {
    New-Item -Path $screenPath -ItemType Directory -Force | Out-Null
    Write-Host "  ✓ Created screen directory" -ForegroundColor Green
}

# Copy profile picture to icon locations
Write-Host "Step 2: Setting up application icon..." -ForegroundColor Yellow
try {
    Copy-Item -Path $profPicPath -Destination "$iconPath\icon.png" -Force
    Write-Host "  ✓ Icon configured" -ForegroundColor Green
}
catch {
    Write-Host "  ⚠ Warning: Could not copy icon file: $_" -ForegroundColor Yellow
}

# Create a simple splash screen if ImageMagick is available
Write-Host "Step 3: Checking for required tools..." -ForegroundColor Yellow

# Check for Node.js
$nodeCheck = node --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "  ✓ Node.js is installed: $nodeCheck" -ForegroundColor Green
} else {
    Write-Host "  ⚠ Node.js is not installed or not in PATH" -ForegroundColor Yellow
}

# Check for Java
$javaCheck = java -version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "  ✓ Java SDK is installed" -ForegroundColor Green
} else {
    Write-Host "  ⚠ Java SDK is not installed" -ForegroundColor Yellow
}

# Check for Android SDK
if ($env:ANDROID_SDK_ROOT) {
    Write-Host "  ✓ Android SDK found at: $env:ANDROID_SDK_ROOT" -ForegroundColor Green
} else {
    Write-Host "  ⚠ ANDROID_SDK_ROOT not set" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Step 4: Setting up dependencies..." -ForegroundColor Yellow
cd $projectPath

# Check if node_modules exists
if (-not (Test-Path "$projectPath\node_modules")) {
    Write-Host "  Installing npm packages..." -ForegroundColor Gray
    npm install | Out-Null
    Write-Host "  ✓ npm packages installed" -ForegroundColor Green
} else {
    Write-Host "  ✓ npm packages already installed" -ForegroundColor Green
}

Write-Host ""
Write-Host "==================================================" -ForegroundColor Green
Write-Host "Setup completed successfully!" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Open Command Prompt and navigate to: $projectPath" -ForegroundColor White
Write-Host "2. Run: build.bat" -ForegroundColor White
Write-Host ""
Write-Host "Or manually run:" -ForegroundColor Cyan
Write-Host "  npm install -g cordova" -ForegroundColor Gray
Write-Host "  cordova platform add android" -ForegroundColor Gray
Write-Host "  cordova build android --release" -ForegroundColor Gray
Write-Host ""
