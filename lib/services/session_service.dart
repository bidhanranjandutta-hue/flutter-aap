import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

/// Service to manage user session timeouts.
///
/// Automatically signs out the user after 30 minutes of inactivity.
class SessionService {
  final AuthService _authService = AuthService();
  Timer? _idleTimer;

  // 30 Minutes timeout constant
  static const Duration idleTimeout = Duration(minutes: 30);

  /// Starts or resets the idle timer.
  ///
  /// If the timer expires, the user is signed out.
  void resetTimer(BuildContext context) {
    _idleTimer?.cancel();
    _idleTimer = Timer(idleTimeout, () => _handleTimeout(context));
  }

  /// Cancels the timer (e.g., on manual logout or app close).
  void cancelTimer() {
    _idleTimer?.cancel();
  }

  Future<void> _handleTimeout(BuildContext context) async {
    if (kDebugMode) {
      print('Session timed out due to inactivity.');
    }

    // Sign out logic
    await _authService.signOut();

    // Navigate to Login Screen (WelcomeScreen)
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Session expired. Please log in again.'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }
}
