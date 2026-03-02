import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:flutter/foundation.dart';

/// Service class handling Authentication via Firebase and Google Sign-In.
///
/// This service encapsulates all authentication logic, including secure Google Drive
/// integration and domain-restricted login.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Scopes required for Google Drive access
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      drive
          .DriveApi
          .driveFileScope, // Allows creating and managing specific files/folders
    ],
  );

  /// Signs in the user using Google Sign-In with domain restriction.
  ///
  /// Enforces that the user email must end with '@police.gov.in'.
  /// In debug mode, allows '@gmail.com' for testing purposes.
  ///
  /// Upon successful login, automatically creates a 'NyayaAssist_User_Data' folder in Google Drive.
  ///
  /// Returns a [UserCredential] on success.
  /// Throws an [Exception] if domain validation fails or an error occurs.
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      // 1. Domain Restriction Check
      final String email = googleUser.email;
      const String requiredDomain = 'police.gov.in';
      bool isAllowed = email.endsWith('@$requiredDomain');

      // Allow Gmail in debug mode for development testing
      if (kDebugMode && email.endsWith('@gmail.com')) {
        isAllowed = true;
      }

      if (!isAllowed) {
        await _googleSignIn.signOut(); // Ensure session is cleared
        throw Exception(
          'Access Denied: Only @$requiredDomain accounts are authorized.',
        );
      }

      // 2. Obtain auth details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 3. Create Firebase credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. Sign in to Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      // 5. Create Google Drive Folder (NyayaAssist_User_Data)
      await _createDriveFolder(googleUser);

      return userCredential;
    } catch (e) {
      if (kDebugMode) {
        print('Error during Google Sign-In: $e');
      }
      rethrow; // Propagate error to UI for Snackbar display
    }
  }

  /// Creates a dedicated folder in the user's Google Drive if it doesn't exist.
  Future<void> _createDriveFolder(GoogleSignInAccount googleUser) async {
    try {
      // Get an authenticated HTTP client via the extension
      final httpClient = await _googleSignIn.authenticatedClient();
      if (httpClient == null) {
        if (kDebugMode) {
          print('Failed to get authenticated HTTP client for Drive API');
        }
        return;
      }

      final driveApi = drive.DriveApi(httpClient);
      const String folderName = 'NyayaAssist_User_Data';

      // Check if folder exists
      final fileList = await driveApi.files.list(
        q: "mimeType = 'application/vnd.google-apps.folder' and name = '$folderName' and trashed = false",
        $fields: "files(id, name)",
      );

      if (fileList.files != null && fileList.files!.isNotEmpty) {
        if (kDebugMode) {
          print(
            'Drive Folder "$folderName" already exists. ID: ${fileList.files!.first.id}',
          );
        }
        return; // Folder exists
      }

      // Create folder
      final drive.File folder = drive.File()
        ..name = folderName
        ..mimeType = 'application/vnd.google-apps.folder';

      final drive.File createdFolder = await driveApi.files.create(folder);

      if (kDebugMode) {
        print('Created Drive Folder "$folderName". ID: ${createdFolder.id}');
      }
    } catch (e) {
      // Log error but don't block login if Drive fails (optional fail-soft strategy)
      if (kDebugMode) {
        print('Error creating Google Drive folder: $e');
      }
    }
  }

  /// Signs out the current user from both Firebase and Google.
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('Error during Sign-Out: $e');
      }
    }
  }

  /// Returns the current authenticated user, if any.
  User? get currentUser => _auth.currentUser;

  /// Stream of authentication state changes.
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
