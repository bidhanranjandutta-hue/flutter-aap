import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      // Initialize if needed (assuming it's not initialized elsewhere, though initialize is usually called once)
      // Since GoogleSignIn.instance.initialize is required before calling authenticate in version 7.x:
      await _googleSignIn.initialize();

      // Trigger the Google Authentication flow
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );
      return googleUser;
    } catch (error) {
      debugPrint('Error signing in with Google: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
