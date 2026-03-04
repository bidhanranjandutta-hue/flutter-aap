import '../models/user.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  // Mocked current user to replace the hardcoded "Inspector Sharma" in UI.
  // In a real application, this would be fetched from an authentication backend.
  User? get currentUser => const User(id: 'user_123', name: 'Inspector Sharma');
}
