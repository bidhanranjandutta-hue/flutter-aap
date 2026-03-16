# GitHub Secrets Checklist: NyayaAssist CI/CD

To fully automate building and distributing the Android (APK) and iOS (IPA) versions of your Flutter app to Firebase App Distribution, you need to configure several sensitive credentials as GitHub Secrets.

Go to your GitHub repository -> **Settings** -> **Secrets and variables** -> **Actions** -> **New repository secret**.

---

### Core Firebase Secrets
These secrets connect your GitHub Actions to your Firebase project.

*   **`FIREBASE_CREDENTIALS`**
    *   **What it is:** The JSON key file that grants GitHub permission to upload to your Firebase project.
    *   **Where to get it:** Firebase Console -> Project Settings -> Service accounts -> Generate new private key (Downloads a `.json` file. Paste the *entire file contents*).
    *   **Required for:** Both (Android & iOS)

*   **`FIREBASE_APP_ID`**
    *   **What it is:** The unique identifier for your Android app in Firebase.
    *   **Where to get it:** Firebase Console -> Project Settings -> General -> "Your apps" (Android icon) -> App ID (e.g., `1:1234567890:android:abcdef123456`).
    *   **Required for:** Android

*   **`FIREBASE_APP_ID_IOS`**
    *   **What it is:** The unique identifier for your iOS app in Firebase.
    *   **Where to get it:** Firebase Console -> Project Settings -> General -> "Your apps" (Apple icon) -> App ID (e.g., `1:1234567890:ios:abcdef123456`).
    *   **Required for:** iOS

---

### Android Code Signing Secrets
These secrets securely sign your release APK so it can be installed on Android devices.

*   **`ANDROID_KEYSTORE_BASE64`**
    *   **What it is:** Your `.jks` (Java Keystore) file, converted into a long text string so GitHub can store it securely.
    *   **Where to get it:** Generate a keystore using `keytool`, then run `base64 -i your-keystore.jks` in terminal. Paste the giant text output here.
    *   **Required for:** Android

*   **`ANDROID_KEYSTORE_PASSWORD`**
    *   **What it is:** The master password you set when creating the `.jks` keystore file.
    *   **Where to get it:** The password you typed during the `keytool` command.
    *   **Required for:** Android

*   **`ANDROID_KEY_ALIAS`**
    *   **What it is:** The specific name (alias) of the key inside your keystore file (e.g., `upload` or `release`).
    *   **Where to get it:** The alias you defined during the `keytool` command.
    *   **Required for:** Android

*   **`ANDROID_KEY_PASSWORD`**
    *   **What it is:** The password for the specific key alias inside the keystore (often the exact same as `ANDROID_KEYSTORE_PASSWORD`).
    *   **Where to get it:** The key password you typed during the `keytool` command.
    *   **Required for:** Android

---

### iOS Code Signing Secrets
These secrets download your Apple Developer credentials to a temporary Mac runner to sign the `.ipa` file.

*   **`BUILD_CERTIFICATE_BASE64`**
    *   **What it is:** Your Apple Distribution Certificate (`.p12` file) converted to text.
    *   **Where to get it:** Export the `.p12` from Keychain Access on a Mac, then run `base64 -i certificate.p12 | pbcopy` in terminal.
    *   **Required for:** iOS

*   **`P12_PASSWORD`**
    *   **What it is:** The password protecting the `.p12` certificate.
    *   **Where to get it:** The password you created when you right-clicked and exported the `.p12` from Keychain Access.
    *   **Required for:** iOS

*   **`BUILD_PROVISION_PROFILE_BASE64`**
    *   **What it is:** Your Ad-Hoc Provisioning Profile (`.mobileprovision` file) converted to text.
    *   **Where to get it:** Download it from the Apple Developer Portal, then run `base64 -i profile.mobileprovision | pbcopy`.
    *   **Required for:** iOS

*   **`KEYCHAIN_PASSWORD`**
    *   **What it is:** A temporary password used by the GitHub macOS runner to create a temporary keychain for the build.
    *   **Where to get it:** *Make one up.* (e.g., `temp_mac_runner_pass_123`). The workflow uses this internally; it doesn't matter what it is as long as you set it.
    *   **Required for:** iOS

---

## Copy-Paste Setup Table

You can use the following table to keep track of your progress while setting these up in GitHub Settings.

| Secret Name | Value Type / Source | Required For | Status |
| :--- | :--- | :---: | :---: |
| `FIREBASE_CREDENTIALS` | Contents of Service Account `.json` | Both | [ ] |
| `FIREBASE_APP_ID` | String (from Firebase Android settings) | Android | [ ] |
| `FIREBASE_APP_ID_IOS` | String (from Firebase iOS settings) | iOS | [ ] |
| `ANDROID_KEYSTORE_BASE64` | Base64 string of `.jks` file | Android | [ ] |
| `ANDROID_KEYSTORE_PASSWORD` | Keystore password string | Android | [ ] |
| `ANDROID_KEY_ALIAS` | Alias name string (e.g. `upload`) | Android | [ ] |
| `ANDROID_KEY_PASSWORD` | Key password string | Android | [ ] |
| `BUILD_CERTIFICATE_BASE64` | Base64 string of `.p12` certificate | iOS | [ ] |
| `P12_PASSWORD` | Password used during `.p12` export | iOS | [ ] |
| `BUILD_PROVISION_PROFILE_BASE64` | Base64 string of `.mobileprovision` file | iOS | [ ] |
| `KEYCHAIN_PASSWORD` | Any random temporary password string | iOS | [ ] |
