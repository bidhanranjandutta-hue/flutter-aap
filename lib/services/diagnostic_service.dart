import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'gemini_service.dart';

/// Represents the structured data sent to the DevOps agent.
class BugDossier {
  final String userComplaint;
  final String translatedComplaint;
  final String deviceState;
  final String errorLogs;
  final String visualAnalysis;
  final DateTime timestamp;

  BugDossier({
    required this.userComplaint,
    required this.translatedComplaint,
    required this.deviceState,
    required this.errorLogs,
    required this.visualAnalysis,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'userComplaint': userComplaint,
      'translatedComplaint': translatedComplaint,
      'deviceState': deviceState,
      'errorLogs': errorLogs,
      'visualAnalysis': visualAnalysis,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());
}

/// The @LiveDiagnosticAgent implementation.
class DiagnosticService {
  final GeminiService _geminiService = GeminiService('YOUR_API_KEY_HERE');

  /// Captures current app state, logs, and uses Gemini to analyze intent and translate.
  Future<BugDossier> generateBugDossier({
    required String userComplaint,
    required bool hasScreenshot,
    required bool hasVideo,
  }) async {
    // 1. Capture mocked device state & logs (Hidden from user)
    const mockDeviceState = "OS: Android 13, Memory: 4GB/8GB, Route: /synopsis";
    const mockErrorLogs =
        "Exception: FormatException at lib/models/case_synopsis_model.dart:24";

    // 2. Call Gemini for Translation & Visual Analysis
    String translatedText = userComplaint;
    String visualAnalysis = "No visual media provided.";

    try {
      final prompt =
          '''
      You are the @LiveDiagnosticAgent for NyayaAssist.
      1. Translate the following user complaint to English if it is in an Indian language: "$userComplaint"
      2. If media was provided (Screenshot: $hasScreenshot, Video: $hasVideo), infer what the user likely did that caused an error matching this log: "$mockErrorLogs".

      Output JSON format:
      {
        "translated_complaint": "english translation",
        "visual_analysis": "inference based on logs and assumed media content"
      }
      ''';

      // Re-using the generateContent logic (ignoring actual images for this headless mock)
      final response = await _geminiService.generateCaseSynopsis(
        prompt,
      ); // Reusing method for quick JSON return

      if (response != null) {
        try {
          final parsed = json.decode(response);
          translatedText = parsed['translated_complaint'] ?? translatedText;
          visualAnalysis = parsed['visual_analysis'] ?? visualAnalysis;
        } catch (_) {
          // Handle malformed JSON
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Diagnostic Agent Error: $e');
      }
    }

    return BugDossier(
      userComplaint: userComplaint,
      translatedComplaint: translatedText,
      deviceState: mockDeviceState,
      errorLogs: mockErrorLogs,
      visualAnalysis: visualAnalysis,
      timestamp: DateTime.now(),
    );
  }
}
