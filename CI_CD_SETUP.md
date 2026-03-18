# Android CI/CD Setup Guide for NyayaAssist

This guide contains everything you need to set up automatic Android builds and deployments for your Flutter app using GitHub Actions and Firebase App Distribution.

---

## 1. Required GitHub Secrets List
You need to add these secrets in your GitHub repository (`Settings` > `Secrets and variables` > `Actions` > `New repository secret`).

**Firebase Secrets:**
- `FIREBASE_APP_ID_ANDROID`: Your Android App ID from the Firebase Console (e.g., `1:1234567890:android:abc123def456`).
- `FIREBASE_SERVICE_ACCOUNT_JSON`: The full JSON content of your Firebase Service Account key.
- `FIREBASE_TESTER_GROUPS`: The alias of your Firebase tester group (e.g., `qa-team`, `internal-testers`).

**Android Code Signing Secrets:**
- `ANDROID_KEYSTORE_BASE64`: Your keystore `.jks` file encoded in base64.
- `ANDROID_KEY_ALIAS`: The alias name you chose when generating your keystore.
- `ANDROID_KEY_PASSWORD`: The password for the specific key alias.
- `ANDROID_KEYSTORE_PASSWORD`: The password for the entire keystore file.

---

## 2. Android Signing Setup Instructions

To build a release APK, Android requires it to be digitally signed with a keystore file.

### Step A: Generate a Keystore
1. Open your terminal.
2. Run this command (macOS/Linux):
   ```bash
   keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
   *(On Windows, you might need to run this from `C:\Program Files\Java\jdkX.X.X_X\bin`)*
3. It will ask you for a keystore password and some information (name, organization, etc.). **Remember the password and the alias (`upload`)!**

### Step B: Encode the Keystore to Base64
GitHub Actions cannot store binary files directly, so we convert it to text (base64).
1. Open your terminal.
2. Run this command:
   ```bash
   # macOS / Linux
   base64 -i upload-keystore.jks -o keystore_base64.txt

   # Windows (PowerShell)
   [convert]::ToBase64String((Get-Content -path "upload-keystore.jks" -Encoding byte)) > keystore_base64.txt
   ```
3. Open `keystore_base64.txt`, copy all the text, and paste it into GitHub as the `ANDROID_KEYSTORE_BASE64` secret.

---

## 3. Firebase App Distribution Setup Instructions

### Step A: Get your Firebase App ID
1. Go to your [Firebase Console](https://console.firebase.google.com/).
2. Open your project -> Click the **Gear Icon (Project Settings)**.
3. Scroll down to your Android App and copy the **App ID**. Save this as `FIREBASE_APP_ID_ANDROID` in GitHub secrets.

### Step B: Generate a Service Account JSON
Firebase needs this so GitHub Actions is authorized to upload the APK on your behalf.
1. In the Firebase Console, go to **Project Settings** -> **Service accounts**.
2. Click **Generate new private key** -> **Generate Key**.
3. A `.json` file will download to your computer.
4. Open the `.json` file in a text editor, copy all the contents, and paste it into GitHub as the `FIREBASE_SERVICE_ACCOUNT_JSON` secret.

### Step C: Enable App Distribution and Create a Group
1. In Firebase Console, go to **Release & Monitor** -> **App Distribution**.
2. Click **Get Started** if you haven't already.
3. Go to the **Testers & Groups** tab.
4. Click **Add group**. Name it something simple like `qa-team`.
5. Add your email address to the group.
6. Save the group name (`qa-team`) as the `FIREBASE_TESTER_GROUPS` secret in GitHub.

---

## 4. Troubleshooting Guide for Common Errors

**Error: "Invalid keystore format" or "Keystore was tampered with"**
* **Why it happens:** The `ANDROID_KEYSTORE_BASE64` secret might have extra spaces, newlines, or was generated incorrectly.
* **Fix:** Re-run the base64 encode command. Make sure you don't accidentally copy any trailing spaces when pasting it into GitHub Secrets.

**Error: "401 Unauthorized" or "Failed to authenticate with Firebase"**
* **Why it happens:** The `FIREBASE_SERVICE_ACCOUNT_JSON` is either missing, copy-pasted incorrectly, or the service account doesn't have the required permissions.
* **Fix:** Check the secret formatting. Ensure the entire JSON structure (including the opening `{` and closing `}`) was copied.

**Error: "Tester group does not exist"**
* **Why it happens:** You provided a group name in `FIREBASE_TESTER_GROUPS` that hasn't been created in the Firebase console yet.
* **Fix:** Go to the Firebase console -> App Distribution -> Testers & Groups and ensure the alias matches exactly.

**Error: Workflow fails at "Run Analyze" or "Run Tests"**
* **Why it happens:** You have Dart/Flutter code errors, linting warnings, or failing unit tests. The pipeline is designed to stop if these fail.
* **Fix:** Check the GitHub Actions logs to see the specific error. Run `flutter analyze` and `flutter test` locally on your computer and fix the issues before pushing to GitHub again.
