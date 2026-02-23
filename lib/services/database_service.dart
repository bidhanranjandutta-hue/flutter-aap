import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// Service class handling all interactions with Cloud Firestore.
///
/// This service acts as the data access layer, ensuring all database operations
/// are secure and adhere to the principle of least privilege.
class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Saves user data to the 'users' collection upon successful sign-in.
  ///
  /// [uid] is the Firebase Authentication User ID.
  /// [data] is a map of user profile information.
  ///
  /// Uses [SetOptions(merge: true)] to update existing documents without overwriting.
  Future<void> saveUserData(String uid, Map<String, dynamic> data) async {
    try {
      await _db.collection('users').doc(uid).set(data, SetOptions(merge: true));
    } catch (e) {
      if (kDebugMode) {
        print('Error saving user data: $e');
      }
      throw Exception('Failed to save user data');
    }
  }

  /// Retrieves user data for a specific [uid].
  ///
  /// Returns a [DocumentSnapshot] containing the user's data.
  Future<DocumentSnapshot> getUserData(String uid) async {
    try {
      return await _db.collection('users').doc(uid).get();
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving user data: $e');
      }
      throw Exception('Failed to retrieve user data');
    }
  }
}
