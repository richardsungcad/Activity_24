# Copy Profile Picture to App Icons
# This script copies the profile picture from ../profpic.jpeg to the app icon folder

param(
    [string]$ProfilePicPath = "C:\MAMP\htdocs\IndexedBD\profpic.jpeg",
    [string]$ProjectRoot = "C:\MAMP\htdocs\IndexedBD\RichardToolsHub"
)

Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  Profile Picture Setup for App Icon       ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Verify profile picture exists
if (-not (Test-Path $ProfilePicPath)) {
    Write-Host "ERROR: Profile picture not found!" -ForegroundColor Red
    Write-Host "Expected location: $ProfilePicPath" -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ Profile picture found" -ForegroundColor Green
Write-Host "  Source: $ProfilePicPath" -ForegroundColor Gray
Write-Host ""

# Create icon directories
$iconDirs = @(
    "$ProjectRoot\res\icon\android",
    "$ProjectRoot\res\screen\android"
)

foreach ($dir in $iconDirs) {
    if (-not (Test-Path $dir)) {
        New-Item -Path $dir -ItemType Directory -Force | Out-Null
        Write-Host "✓ Created directory: $dir" -ForegroundColor Green
    } else {
        Write-Host "✓ Directory exists: $dir" -ForegroundColor Green
    }
}

Write-Host ""

# Copy profile picture to icon locations
$targetLocations = @(
    "$ProjectRoot\res\icon\android\icon.png",
    "$ProjectRoot\res\icon\android\avatar.jpg"
)

foreach ($target in $targetLocations) {
    try {
        Copy-Item -Path $ProfilePicPath -Destination $target -Force
        $fileSize = (Get-Item $target).Length / 1KB
        Write-Host "✓ Copied to: $(Split-Path $target -Leaf)" -ForegroundColor Green
        Write-Host "  Size: $([Math]::Round($fileSize, 2)) KB" -ForegroundColor Gray
    }
    catch {
        Write-Host "⚠ Warning: Could not copy to $(Split-Path $target -Leaf)" -ForegroundColor Yellow
        Write-Host "  Error: $_" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  Setup Complete!                          ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "Your profile picture has been configured as the app icon." -ForegroundColor Cyan
Write-Host "It will appear when you build and install the APK." -ForegroundColor Cyan
