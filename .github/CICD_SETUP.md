# NyayaAssist CI/CD Setup Guide

This guide explains how to set up the GitHub Actions CI/CD pipeline for NyayaAssist to automatically build and distribute the app to Firebase App Distribution.

## 🔑 Required GitHub Secrets

You need to add the following secrets to your GitHub repository under **Settings > Secrets and variables > Actions > Repository secrets**.

### Firebase Secrets (Common)
* `CREDENTIAL_FILE_CONTENT`: The contents of your Google Cloud Service Account JSON key. This service account needs the "Firebase App Distribution Admin" role.
* `FIREBASE_ANDROID_APP_ID`: Your Android App ID from Firebase (e.g., `1:1234567890:android:abcdef123456`).
* `FIREBASE_IOS_APP_ID`: Your iOS App ID from Firebase (e.g., `1:1234567890:ios:abcdef123456`).

### Android Secrets
* `ANDROID_KEYSTORE_BASE64`: A Base64-encoded string of your release keystore file (`.jks`).
* `ANDROID_KEYSTORE_PASSWORD`: The password for the keystore.
* `ANDROID_KEY_ALIAS`: The key alias used for signing.
* `ANDROID_KEY_PASSWORD`: The password for the specific key.

### iOS Secrets
* `BUILD_CERTIFICATE_BASE64`: A Base64-encoded string of your Apple Distribution Certificate (`.p12` file).
* `P12_PASSWORD`: The password for the `.p12` certificate file.
* `BUILD_PROVISION_PROFILE_BASE64`: A Base64-encoded string of your Apple Provisioning Profile (`.mobileprovision` file).
* `KEYCHAIN_PASSWORD`: A random temporary password used by the GitHub Actions runner to create a local keychain (e.g., `temp-ci-password`).
* `IOS_EXPORT_OPTIONS_PLIST_BASE64`: A Base64-encoded string of your `ExportOptions.plist` file (generated when exporting an IPA manually via Xcode).

---

## 🛠️ Step-by-Step Configuration Guide

### 1. Firebase Service Account Setup
Instead of the older `FIREBASE_TOKEN`, we use a secure Service Account.
1. Go to the [Google Cloud Console](https://console.cloud.google.com/).
2. Select your Firebase project.
3. Go to **IAM & Admin > Service Accounts**.
4. Click **Create Service Account**. Name it something like `github-actions-app-distribution`.
5. Grant it the role **Firebase App Distribution Admin**.
6. Once created, click on the service account > **Keys** > **Add Key** > **Create new key** (JSON format).
7. Open the downloaded JSON file, copy the entire content, and save it as the `CREDENTIAL_FILE_CONTENT` secret in GitHub.

### 2. Android Keystore Setup
If you don't have a release keystore, generate one:
```bash
keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```
To encode it to Base64 (on Mac/Linux):
```bash
base64 -i upload-keystore.jks | pbcopy
```
Paste the clipboard content into the `ANDROID_KEYSTORE_BASE64` secret.

**Important Flutter Setup for Android Signing:**
You must ensure your `android/app/build.gradle` (or `build.gradle.kts`) is configured to read the `key.properties` file that the GitHub Action generates.

The standard Flutter documentation provides the snippet to add to your `build.gradle` before the `android` block:
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    // ...
    signingConfigs {
        release {
            keyAlias = keystoreProperties['keyAlias']
            keyPassword = keystoreProperties['keyPassword']
            storeFile = keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword = keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

### 3. iOS Certificate Setup (Without Fastlane)
You need an Apple Developer account.
1. Create an **App Store / Ad Hoc Distribution Certificate** in the Apple Developer Portal.
2. Download and double-click to install it in Keychain Access.
3. Export it from Keychain Access as a `.p12` file (you will be asked to set a password; this is `P12_PASSWORD`).
4. Base64 encode the `.p12` file:
```bash
base64 -i Certificate.p12 | pbcopy
```
Paste this into the `BUILD_CERTIFICATE_BASE64` secret.

### 4. iOS Provisioning Profile Setup
1. Create an **Ad Hoc Provisioning Profile** in the Apple Developer Portal linked to your App ID and the Certificate above.
2. Download the `.mobileprovision` file.
3. Base64 encode it:
```bash
base64 -i profile.mobileprovision | pbcopy
```
Paste this into the `BUILD_PROVISION_PROFILE_BASE64` secret.

### 5. iOS ExportOptions.plist
To correctly build an IPA from the command line, you need an `ExportOptions.plist`.
1. The easiest way to get this is to build the app once locally using Xcode and choose **Product > Archive**, then click **Distribute App** (Ad Hoc or App Store Connect).
2. When the export finishes, Xcode creates a folder containing your IPA and an `ExportOptions.plist`.
3. Base64 encode this file:
```bash
base64 -i ExportOptions.plist | pbcopy
```
Paste this into the `IOS_EXPORT_OPTIONS_PLIST_BASE64` secret.

---

## 🚀 Firebase App Distribution Tester Groups

By default, the workflows notify a tester group named `testers`.
1. Go to the Firebase Console > App Distribution.
2. Go to the **Testers & Groups** tab.
3. Create a group with the alias `testers`.
4. Add your QA or testing team emails to this group.

Whenever code is pushed to the `main` branch, the GitHub Action will automatically build, upload, and send an email to this group with download instructions!