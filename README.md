# Richard Tools Hub - Mobile Application

## Project Overview

Richard Tools Hub is a comprehensive tool inventory management mobile application built with Apache Cordova. It features user authentication, product management with images, and IndexedDB for offline data storage.

## Features

### ✓ Implemented Features
- **User Authentication**
  - User registration without email verification
  - Secure login and logout
  - Password visibility toggle with eye icon
  
- **User Profile Management**
  - Edit user information (First Name, Last Name)
  - Upload and change profile picture
  
- **Product Inventory Management (CRUD)**
  - Add new products with images, prices, quantities, and descriptions
  - Update existing products
  - Delete products
  - Track remaining product quantities
  
- **Product Search & Filtering**
  - Search by product name
  - Filter by category
  - Search by price
  
- **Categories**
  - Plasticware
  - Kitchenware
  - Beauty Products
  - Mobile Phone Accessories
  - Foam
  - Tools
  
- **UI/UX Features**
  - "Richard Tools Hub" with animated wrench emoji 🔧 on all screens
  - Splash screen with large wrench emoji
  - Responsive design for mobile devices
  - Product cards with minimized layout
  - Real-time product count display
  - Quantity status indicator (Out of Stock, Low Stock)
  
- **Currency**
  - Philippine Peso symbol (₱) for all prices
  - Proper number formatting with comma separators
  
- **Database**
  - IndexedDB for client-side storage
  - Complete CRUD operations
  - Data persistence

## System Requirements

### Required Software
1. **Node.js** (v12 or higher)
   - Download: https://nodejs.org/
   
2. **Java SDK** (Java 8 or higher)
   - Download: https://www.oracle.com/java/technologies/javase-downloads.html
   
3. **Android SDK**
   - Download: https://developer.android.com/studio
   - Minimum SDK Version: 19
   
4. **Cordova CLI**
   - Install via npm: `npm install -g cordova`

### Development Machine
- Windows 10/11 with at least 4GB RAM
- 2GB free disk space for Android SDK

## Project Structure

```
RichardToolsHub/
├── www/                          # Web application files
│   ├── index.html               # Main HTML file (all pages)
│   ├── css/
│   │   └── style.css            # Styling with animations
│   ├── js/
│   │   ├── app.js               # Main application logic
│   │   ├── auth.js              # Authentication module
│   │   ├── db.js                # IndexedDB operations
│   │   └── products.js          # Product CRUD operations
│   └── img/                     # Image assets
├── res/
│   ├── icon/
│   │   └── android/
│   │       └── icon.png         # App icon (from profile picture)
│   └── screen/
│       └── android/
│           └── splash.png       # Splash screen
├── config.xml                   # Cordova configuration
├── package.json                 # Node dependencies
├── build.bat                    # Build script (Windows)
├── setup.ps1                    # Setup script (PowerShell)
└── README.md                    # This file
```

## Installation & Setup

### Step 1: Initial Setup

Run the PowerShell setup script:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
cd C:\MAMP\htdocs\IndexedBD\RichardToolsHub
.\setup.ps1
```

Or manually:

```bash
cd C:\MAMP\htdocs\IndexedBD\RichardToolsHub
npm install
npm install -g cordova
```

### Step 2: Configure Android Environment

Set up environment variables:

1. Open System Properties → Environment Variables
2. Add `JAVA_HOME` pointing to your Java installation
3. Add `ANDROID_SDK_ROOT` pointing to your Android SDK installation

Example:
```
JAVA_HOME=C:\Program Files\Java\jdk1.8.0_301
ANDROID_SDK_ROOT=C:\Users\YourUsername\AppData\Local\Android\Sdk
```

### Step 3: Add Android Platform

```bash
cd C:\MAMP\htdocs\IndexedBD\RichardToolsHub
cordova platform add android
```

### Step 4: Add Required Plugins

```bash
cordova plugin add cordova-plugin-camera
cordova plugin add cordova-plugin-file
cordova plugin add cordova-plugin-file-transfer
cordova plugin add cordova-plugin-splashscreen
cordova plugin add cordova-plugin-dialogs
cordova plugin add cordova-plugin-whitelist
```

## Building the APK

### Option 1: Using Build Script (Recommended)

```bash
cd C:\MAMP\htdocs\IndexedBD\RichardToolsHub
build.bat
```

### Option 2: Manual Build

Debug APK:
```bash
cordova build android
```

Release APK (for app store):
```bash
cordova build android --release
```

### Output Location

After successful build, find your APK at:
- **Debug**: `platforms/android/app/build/outputs/apk/debug/app-debug.apk`
- **Release**: `platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk`

## Installation on Mobile Device

### Testing on Emulator

```bash
cordova run android
```

### Installation on Physical Device

1. Enable "Developer Mode" on your Android device
2. Connect via USB with USB Debugging enabled
3. Run: `cordova run android`

Or manually:
1. Copy the APK file to your device
2. Open file manager and tap the APK
3. Allow installation from unknown sources
4. Tap Install

## Database Schema

### Users Table
```javascript
{
  id: Number (auto-increment),
  firstName: String,
  lastName: String,
  username: String (unique),
  password: String,
  profilePic: String (base64 or null),
  createdAt: ISO String
}
```

### Products Table
```javascript
{
  id: Number (auto-increment),
  name: String,
  category: String,
  price: Number,
  quantity: Number,
  description: String,
  image: String (base64 or null),
  ownerUsername: String,
  ownerName: String,
  createdAt: ISO String,
  updatedAt: ISO String
}
```

## Usage Guide

### First Time Users

1. **Splash Screen**: Wait for the welcome screen to load (3 seconds)
2. **Registration**: Click "Register here" and create a new account
3. **Profile**: Upload your profile picture
4. **Add Products**: Start adding your tools/products to inventory
5. **Manage**: View, edit, and delete products

### Login
- Username: Your registered username
- Password: Your registered password
- Toggle password visibility with the eye icon

### Adding Products
- Fill in all required fields (Name, Category, Price, Quantity)
- Optionally upload a product image
- Add description
- Click "Add Product"

### Searching Products
- Use the search bar to search by:
  - Product name
  - Category
  - Price (numeric search)

### Editing Products
- Click the "Edit" button on any product card
- Modify details and click "Update Product"

### Deleting Products
- Click the "Delete" button on any product card
- Confirm deletion

## Features Detail

### Password Security
- Password field with toggle visibility
- Click the eye icon to show/hide password
- Minimum 4 characters required

### Product Quantity Status
- **Out of Stock**: Quantity = 0 (displayed in red)
- **Low Stock**: Quantity < 5 (warning indicator)
- **Available**: Quantity displayed with "Remaining Product:" label

### Pricing
- All prices displayed with Philippine Peso symbol (₱)
- Proper formatting with thousand separators
- Example: ₱1,234.50

### Categories
Products can be categorized as:
- Plasticware
- Kitchenware
- Beauty Products
- Mobile Phone Accessories
- Foam
- Tools

## Troubleshooting

### Build Fails - "ANDROID_SDK_ROOT not found"
**Solution**: 
```bash
Set ANDROID_SDK_ROOT=C:\Users\YourUsername\AppData\Local\Android\Sdk
```

### Build Fails - "Java not found"
**Solution**: Install Java SDK and set JAVA_HOME environment variable

### Build Fails - "Platform not added"
**Solution**: Run `cordova platform add android`

### Build Fails - "Plugin errors"
**Solution**: 
```bash
cordova plugin remove cordova-plugin-camera
cordova plugin add cordova-plugin-camera
```

### App Won't Start
**Solution**: 
- Clear app cache
- Uninstall and reinstall
- Check browser console for errors (Chrome DevTools)

### Data Not Persisting
**Solution**:
- Check browser's IndexedDB (Chrome DevTools → Application → IndexedDB)
- Clear browser cache
- Re-login to the application

## Security Notes

⚠️ **Important**: This is a demo application. For production use:

1. **Hash Passwords**: Use bcrypt or similar for password hashing
2. **SSL/TLS**: Use HTTPS for data transmission
3. **Data Encryption**: Encrypt sensitive data before storing
4. **Input Validation**: Validate all user inputs
5. **Authentication Tokens**: Use JWT or session tokens

## Debugging

### Enable Debug Mode

```bash
cordova run android --verbose
```

### Check Device Logs

```bash
adb logcat
```

### Browser DevTools

1. Connect device with USB debugging
2. In Chrome: `chrome://inspect`
3. Find your device and click "Inspect"

## Building Release APK

For app store submission:

```bash
cordova build android --release
```

Then sign with your keystore:
```bash
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 
  -keystore my-release-key.jks 
  app-release-unsigned.apk 
  alias_name

zipalign -v 4 app-release-unsigned.apk app-release.apk
```

## Version History

### v1.0.0 (Current)
- Initial release
- Complete CRUD operations
- User authentication
- Image upload support
- IndexedDB database
- Search & filter functionality

## Support & Contact

For issues, questions, or suggestions, please refer to the inline code documentation.

## License

MIT License - Feel free to use and modify

---

**Last Updated**: April 12, 2026
**Platform**: Apache Cordova
**Target OS**: Android 5.0+ (SDK 19+)
