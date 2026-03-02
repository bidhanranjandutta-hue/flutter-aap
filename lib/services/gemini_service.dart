import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/foundation.dart';

class GeminiService {
  final GenerativeModel _model;

  GeminiService(String apiKey)
    : _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  Future<GenerateContentResponse> generateContent(String prompt) async {
    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    return response;
  }

  /// Generates a neutral, one-page case synopsis from raw case file text (FIR/Diary).
  ///
  /// Enforces adherence to the Indian Constitution, BNS, BNSS, and BSA.
  /// Returns a JSON string structured for the UI.
  Future<String?> generateCaseSynopsis(String text) async {
    try {
      final prompt =
          '''
      You are a neutral AI Legal Assistant (NyayaAssist) operating EXCLUSIVELY under Indian Law. Every response MUST comply with:
      - Primary Legislation (NEW — Effective 1 July 2024):
        1. Bharatiya Nyaya Sanhita, 2023 (BNS) - Act No. 45 of 2023
        2. Bharatiya Nagarik Suraksha Sanhita, 2023 (BNSS) - Act No. 46 of 2023
        3. Bharatiya Sakshya Adhiniyam, 2023 (BSA) - Act No. 47 of 2023
      - The Constitution of India.
      Do NOT use old IPC, CrPC, or IEA sections except for explicit compatibility mapping if requested.

      Analyze the following case file text:
      "$text"

      Extract and structure the information into a JSON format exactly like this:
      {
        "fiveWs": {
          "WHO": "Parties involved",
          "WHAT": "Core incident",
          "WHEN": "Time/Date",
          "WHERE": "Location",
          "HOW": "Method of operation"
        },
        "analysis": {
          "Subject": "Main legal subject matter",
          "Situation": "Factual situation",
          "Position": "Current legal position/status",
          "Condition": "Aggravating/Mitigating conditions"
        },
        "suggested_sections": [
          {
            "act": "BNS 2023",
            "section": "Section number (e.g., 302)",
            "title": "Short title of the section",
            "mapping": "Mapped from IPC/CrPC equivalent (optional)"
          }
        ]
      }

      IMPORTANT:
      - Be absolutely neutral. Do not presume guilt.
      - Base all legal suggestions strictly on the new 2023 laws.
      - Return ONLY valid JSON, no markdown formatting blocks like ```json.
      ''';

      final response = await _model.generateContent([Content.text(prompt)]);

      // Clean up potential markdown formatting from Gemini response
      String cleanJson = response.text?.trim() ?? '';
      if (cleanJson.startsWith('```json')) {
        cleanJson = cleanJson.substring(7);
      }
      if (cleanJson.endsWith('```')) {
        cleanJson = cleanJson.substring(0, cleanJson.length - 3);
      }

      return cleanJson.trim();
    } catch (e) {
      if (kDebugMode) {
        print('Gemini Synopsis Error: $e');
      }
      return null;
    }
  }

  /// Repairs broken or low-confidence legal text using Gemini's context awareness.
  ///
  /// [text] - The raw OCR text block.
  /// [previousText] - Preceding context (optional).
  /// [nextText] - Following context (optional).
  Future<String> repairLegalText(
    String text, {
    String? previousText,
    String? nextText,
  }) async {
    try {
      final prompt =
          '''
      You are a legal AI expert (NyayaAssist). The following text snippet from an Indian legal document (FIR/Charge Sheet) has low OCR confidence or missing words.

      Context (Previous): ${previousText ?? "N/A"}
      Target Text (Repair This): "$text"
      Context (Next): ${nextText ?? "N/A"}

      Task: Predict and fill in the missing/garbled words based on standard Indian legal terminology.
      Prioritize the new Bharatiya Nyaya Sanhita (BNS), Bharatiya Nagarik Suraksha Sanhita (BNSS), and Bharatiya Sakshya Adhiniyam (BSA) effective July 1, 2024. Use IPC/CrPC only if the context is explicitly a legacy document.
      Output only the repaired text string. Do not include explanations.
      ''';

      final response = await _model.generateContent([Content.text(prompt)]);
      return response.text?.trim() ?? text; // Return original if AI fails
    } catch (e) {
      if (kDebugMode) {
        print('Gemini Repair Error: $e');
      }
      return text; // Fallback to original
    }
  }
}
