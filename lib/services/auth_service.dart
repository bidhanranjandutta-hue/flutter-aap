/// A very simple mock authentication service.
/// It pretends to log a user in.
class MockAuthService {
  /// Pretend to log in a user and wait for 1 second.
  Future<bool> login() async {
    // We wait for 1 second to pretend it's talking to a real server.
    await Future.delayed(const Duration(seconds: 1));
    // We always return true to pretend the login was successful.
    return true;
  }
}
