import '../models/user.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  // Singleton pattern for simple state management across screens
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  User? _currentUser;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  // Mock login function simulating an async operation
  Future<bool> loginWithGoogle() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Mock authenticated user data
      _currentUser = const User(
        id: 'mock_user_123',
        name: 'Inspector Sharma',
        email: 'sharma.inspector@police.gov.in',
      );

      debugPrint('User logged in: ${_currentUser?.name}');
      return true;
    } catch (e) {
      debugPrint('Login failed: $e');
      return false;
    }
  }

  // Mock logout function
  Future<void> logout() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    _currentUser = null;
    debugPrint('User logged out');
  }
}
