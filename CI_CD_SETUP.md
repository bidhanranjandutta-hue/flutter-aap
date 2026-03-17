# Complete CI/CD Setup Guide for Flutter (GitHub Actions + Firebase)

Welcome! This guide is designed for beginners. It will walk you through setting up automated Continuous Integration and Continuous Deployment (CI/CD) for your Flutter app using GitHub Actions and Firebase App Distribution.

Whenever you push code to the `main` branch, GitHub will automatically build your Android (`.apk`) and iOS (`.ipa`) apps and send them to your testers via Firebase.

---

## 📑 Table of Contents
1. [Prerequisites](#1-prerequisites)
2. [Setting Up Firebase App Distribution](#2-setting-up-firebase-app-distribution)
3. [Android Configuration (Keystore & Secrets)](#3-android-configuration)
4. [iOS Configuration (Apple Developer & Secrets)](#4-ios-configuration)
5. [Adding Secrets to GitHub](#5-adding-secrets-to-github)
6. [Testing Your Pipeline](#6-testing-your-pipeline)

---

## 1. Prerequisites
Before we start, you will need:
- A [Firebase Project](https://console.firebase.google.com/) created.
- An [Apple Developer Account](https://developer.apple.com/account/) (if you want to build the iOS app).
- Terminal access on a Mac or Linux machine (for generating Base64 strings).

---

## 2. Setting Up Firebase App Distribution
Firebase needs a Service Account to securely upload your apps.

1. **Get the Service Account JSON:**
   - Go to the [Google Cloud Console](https://console.cloud.google.com/). Make sure your Firebase project is selected at the top.
   - Go to **IAM & Admin > Service Accounts**.
   - Click **Create Service Account**, name it "Firebase App Distribution", and assign the role **"Firebase App Distribution Admin"**.
   - Once created, click the three dots on the right > **Manage keys** > **Add Key** > **Create new key** > **JSON**.
   - Download the file. *We will use this later.*

2. **Get your App IDs:**
   - In the [Firebase Console](https://console.firebase.google.com/), go to **Project Settings > General**.
   - Scroll down to your apps.
   - Copy the **App ID** for Android (looks like `1:xxx:android:xxx`).
   - Copy the **App ID** for iOS (looks like `1:xxx:ios:xxx`).

3. **Create a Tester Group:**
   - In Firebase, go to **Release & Monitor > App Distribution**.
   - Click the **Testers & Groups** tab.
   - Create a new group (e.g., `qa-team`) and add tester emails.

---

## 3. Android Configuration
To release an Android app, it must be signed with a keystore.

1. **Generate a Keystore (if you don't have one):**
   Run this in your terminal to create `keystore.jks`:
   ```bash
   keytool -genkey -v -keystore keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
   *Remember the password and alias you choose.*

2. **Encode the Keystore to Base64:**
   GitHub Actions needs to read this file as text. Run this in your terminal:
   ```bash
   # On Mac/Linux:
   base64 -i keystore.jks | pbcopy
   ```
   *This copies a very long string of gibberish to your clipboard. Paste it somewhere safe for step 5.*

---

## 4. iOS Configuration
Building for iOS requires Apple Developer credentials.

1. **Create an App ID and Certificate:**
   - Go to the [Apple Developer Portal](https://developer.apple.com/account/).
   - Under **Certificates, Identifiers & Profiles**, create an **App ID** (Bundle Identifier) for your app.
   - Create an **Apple Distribution Certificate** and download it to your Mac.

2. **Export the Certificate to `.p12`:**
   - Double-click the downloaded certificate to open it in **Keychain Access**.
   - Right-click the certificate > **Export "Apple Distribution:..."**.
   - Save it as a `.p12` file. Choose a strong password.

3. **Create an Ad-Hoc Provisioning Profile:**
   - Back in the Apple Portal, go to **Profiles > +**.
   - Choose **Ad Hoc** under Distribution.
   - Select your App ID, your Certificate, and the devices you want to test on.
   - Download the `.mobileprovision` file.

4. **Encode the iOS Files to Base64:**
   Run these commands to get text versions of your files:
   ```bash
   base64 -i your_certificate.p12 | pbcopy
   # Paste this somewhere safe

   base64 -i your_profile.mobileprovision | pbcopy
   # Paste this somewhere safe
   ```

---

## 5. Adding Secrets to GitHub
We now need to save all this sensitive information into GitHub so our CI/CD workflow can use it securely.

1. Go to your GitHub Repository online.
2. Click **Settings** > **Secrets and variables** > **Actions**.
3. Click **New repository secret**.

Add the following secrets exactly as named:

### Common Secrets
| Secret Name | What to paste |
| :--- | :--- |
| `FIREBASE_SERVICE_ACCOUNT_JSON` | The entire content of the JSON file you downloaded in Step 2.1. |
| `FIREBASE_TESTER_GROUPS` | The alias of your group (e.g., `qa-team`). |

### Android Secrets
| Secret Name | What to paste |
| :--- | :--- |
| `ANDROID_KEYSTORE_BASE64` | The massive Base64 string from Step 3.2. |
| `ANDROID_KEYSTORE_PASSWORD` | The password you made for your keystore. |
| `ANDROID_KEY_ALIAS` | The alias you made (e.g., `upload`). |
| `ANDROID_KEY_PASSWORD` | Usually the same as your keystore password. |
| `FIREBASE_APP_ID_ANDROID` | Your Android App ID from Step 2.2. |

### iOS Secrets
| Secret Name | What to paste |
| :--- | :--- |
| `IOS_CERTIFICATE_P12_BASE64` | The massive Base64 string of your `.p12` file. |
| `IOS_PROVISIONING_PROFILE_BASE64`| The massive Base64 string of your `.mobileprovision` file. |
| `IOS_CERTIFICATE_PASSWORD` | The password you used when exporting the `.p12` file. |
| `IOS_BUNDLE_IDENTIFIER` | Your app's Bundle ID (e.g., `com.example.flutterApp`). |
| `APPLE_TEAM_ID` | Your 10-character Apple Team ID (found in the top right of the Apple Portal). |
| `FIREBASE_APP_ID_IOS` | Your iOS App ID from Step 2.2. |

---

## 6. Testing Your Pipeline!
You are completely done. To test it:

1. Make a small change to your code.
2. Commit and push your code to the `main` branch:
   ```bash
   git add .
   git commit -m "Testing CI/CD Pipeline"
   git push origin main
   ```
3. Go to the **Actions** tab in your GitHub repository.
4. You will see your workflows running! Once they turn green ✅, check your email or Firebase Console—your app is ready to download!