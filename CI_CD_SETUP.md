# NyayaAssist CI/CD Setup Guide for Beginners

This guide will walk you through setting up the automated pipeline for your Flutter app, **NyayaAssist**. This pipeline automatically builds and tests your Android and iOS apps whenever you push to the `main` branch, and then distributes them to your testers via Firebase App Distribution.

We use **GitHub Actions** for the automation, keeping your secure keys inside **GitHub Secrets** so they never leak into the repository code.

---

## 1. Required GitHub Secrets List

Before the pipeline can run successfully, you need to add the following secrets to your GitHub repository.
Go to your repository on GitHub -> **Settings** -> **Secrets and variables** -> **Actions** -> **New repository secret**.

| Secret Name | Description |
|---|---|
| `ANDROID_KEYSTORE_BASE64` | Base64 encoded string of your `.jks` or `.keystore` file. |
| `ANDROID_KEYSTORE_PASSWORD` | The password used to create the keystore. |
| `ANDROID_KEY_ALIAS` | The alias given to the key inside the keystore. |
| `ANDROID_KEY_PASSWORD` | The password for the specific key inside the keystore. |
| `FIREBASE_APP_ID_ANDROID` | Your Android App ID from the Firebase console (looks like `1:1234567890:android:abcde12345`). |
| `FIREBASE_APP_ID_IOS` | Your iOS App ID from the Firebase console (looks like `1:1234567890:ios:abcde12345`). |
| `FIREBASE_SERVICE_ACCOUNT_JSON`| The JSON content of your Google Cloud Service Account for Firebase. |
| `FIREBASE_TESTER_GROUPS` | (Optional) The alias of the tester group in Firebase (e.g., `qa-team`, `testers`). Defaults to `testers`. |
| `IOS_CERTIFICATE_P12_BASE64` | Base64 encoded string of your Apple Distribution Certificate (`.p12` file). |
| `IOS_CERTIFICATE_PASSWORD` | The password used when exporting the `.p12` file. |
| `IOS_PROVISIONING_PROFILE_BASE64`| Base64 encoded string of your `.mobileprovision` file. |
| `IOS_BUNDLE_IDENTIFIER` | Your app's Bundle ID from Apple Developer portal (e.g., `com.example.nyayaassist`). |
| `APPLE_TEAM_ID` | Your 10-character Apple Developer Team ID. |

---

## 2. Generating the Required Secrets

### 2.1 Firebase Service Account JSON

Firebase needs permission to upload the app on your behalf.
1. Go to the [Google Cloud Console](https://console.cloud.google.com/).
2. Select your Firebase project from the top dropdown.
3. Go to **IAM & Admin** -> **Service Accounts**.
4. Click **Create Service Account**. Give it a name like `firebase-ci-cd`.
5. Grant it the role: **Firebase App Distribution Admin**.
6. Once created, click on the new service account, go to the **Keys** tab, and click **Add Key** -> **Create new key**.
7. Choose **JSON**. A file will download to your computer.
8. Open the downloaded file, copy **all the contents**, and paste it into the `FIREBASE_SERVICE_ACCOUNT_JSON` GitHub secret.

### 2.2 Android Keystore Signing

Android requires all apps to be digitally signed before they can be installed.
1. **Create the keystore (if you haven't):** Run the following in your terminal:
   ```bash
   keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
   *Remember the passwords and alias you use here.*
2. **Convert to Base64:** GitHub secrets need to be text, so we convert the binary file to text.
   - On Mac/Linux: `base64 -i upload-keystore.jks > keystore_b64.txt`
   - On Windows (PowerShell): `[convert]::ToBase64String((Get-Content -path "upload-keystore.jks" -Encoding byte)) > keystore_b64.txt`
3. Open `keystore_b64.txt`, copy **all the contents**, and paste it into the `ANDROID_KEYSTORE_BASE64` secret.
4. Add your passwords and alias to the `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_PASSWORD`, and `ANDROID_KEY_ALIAS` secrets.

### 2.3 iOS Certificate and Provisioning Profile

Apple requires highly strict code signing to build an IPA file. You need a Mac for this.
1. **Generate Certificate (.p12):**
   - Go to the [Apple Developer Portal](https://developer.apple.com/) -> **Certificates, Identifiers & Profiles**.
   - Create an **Apple Distribution** certificate.
   - Download the `.cer` file and double-click to install it in your Mac's **Keychain Access**.
   - Open Keychain Access, find the certificate (under "My Certificates"), right-click, and choose **Export**.
   - Save it as a `.p12` file and set a strong password.
   - Run in terminal: `base64 -i your_cert.p12 > p12_b64.txt` (Note: do not use line breaks).
   - Copy the text into the `IOS_CERTIFICATE_P12_BASE64` secret.
   - Put your strong password into the `IOS_CERTIFICATE_PASSWORD` secret.

2. **Generate Provisioning Profile:**
   - On the Apple Developer Portal, create an **Ad Hoc** provisioning profile linked to your app's App ID and the Distribution Certificate you just created.
   - Download the `.mobileprovision` file.
   - Run in terminal: `base64 -i your_profile.mobileprovision > pp_b64.txt`
   - Copy the text into the `IOS_PROVISIONING_PROFILE_BASE64` secret.

3. **Get Team ID and Bundle ID:**
   - Your Team ID is found in the upper right corner of the Apple Developer portal under your name. Put this in `APPLE_TEAM_ID`.
   - Your App ID (e.g., `com.mycompany.nyayaassist`) goes into `IOS_BUNDLE_IDENTIFIER`.

---

## 3. Using the Pipeline

- **Automatic:** Whenever you commit and push code to the `main` branch, the pipeline will start automatically.
- **Manual:** Go to the **Actions** tab in GitHub, select either the Android or iOS workflow on the left, click **Run workflow**, and choose the `main` branch.

**Where to find the App Links:**
When a run finishes, click on the workflow run. Scroll down to the **Summary** page. You will see a section named **Provide Testing Links** with direct links to Firebase to view or download the app!

---

## 4. Troubleshooting Common CI/CD Failures

- **Issue:** The build fails at the "Install Dependencies" or "Run Tests" step.
  - **Fix:** You likely have a failing test or a formatting error. Run `flutter test` locally on your machine to fix the errors before pushing to GitHub.

- **Issue:** Android pipeline fails at "Upload to Firebase App Distribution".
  - **Fix:** Verify `FIREBASE_APP_ID_ANDROID` matches the one in your Firebase console exactly. Ensure your `FIREBASE_SERVICE_ACCOUNT_JSON` has the correct permissions. Ensure `FIREBASE_TESTER_GROUPS` is exactly the alias of the group you created in Firebase.

- **Issue:** iOS build hangs or fails during "Configure iOS Code Signing" or "Build iOS IPA".
  - **Fix:** This is almost always a certificate or provisioning profile mismatch. Ensure the Provisioning Profile was built using the *exact same* Distribution Certificate that you exported as a `.p12`. Check that the `IOS_BUNDLE_IDENTIFIER` exactly matches what is on the Apple Developer portal.

- **Issue:** Base64 decoding fails in the pipeline.
  - **Fix:** When you generated the base64 string, your terminal might have added line breaks. Try generating it again as a single continuous string. On a Mac, use `base64 -i your_file | tr -d '\n' | pbcopy`.
