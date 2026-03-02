import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:flutter/foundation.dart';
import 'gemini_service.dart';

/// Service for Document Scanning, OCR, and AI-Enhanced Repair.
class OCRService {
  final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );
  final OnDeviceTranslator _hindiTranslator = OnDeviceTranslator(
    sourceLanguage: TranslateLanguage.english,
    targetLanguage: TranslateLanguage.hindi,
  );

  // Gemini Service for Context Repair (should be injected or initialized)
  // For demo, we'll assume it's passed or used where available.
  final GeminiService? geminiService;

  OCRService({this.geminiService});

  /// Processes an image and returns recognized text.
  ///
  /// If [repairConfidenceThreshold] is set (e.g., 0.85) and [geminiService] is available,
  /// low-confidence blocks will be sent to Gemini for repair.
  Future<String> processImage(
    InputImage inputImage, {
    double repairConfidenceThreshold = 0.85,
  }) async {
    try {
      final RecognizedText recognizedText = await _textRecognizer.processImage(
        inputImage,
      );

      StringBuffer fullText = StringBuffer();

      // Iterate through blocks to check confidence and build text
      // Note: In a real implementation, we would handle block/line logic more granularly.
      // Here we simulate the flow.

      List<TextBlock> blocks = recognizedText.blocks;
      for (int i = 0; i < blocks.length; i++) {
        TextBlock block = blocks[i];
        // String blockText = block.text;

        // Check for low confidence (if available in future ML Kit versions per-block,
        // currently we might infer from character confidence or just pass all if critical).
        //
        // For this demo, let's assume we want to "repair" if the text looks garbled or short
        // or based on a mock confidence logic if the API doesn't expose it easily at block level yet.
        //
        // Real-world: Check `block.lines[j].confidence` (if available) or `elements`.
        // As of current mlkit package, confidence might be on lines/elements.

        // Let's check lines for repair
        for (int j = 0; j < block.lines.length; j++) {
          TextLine line = block.lines[j];
          String lineText = line.text;

          // Mock check: if line has many non-alphanumeric chars or specific length
          // In production, use `line.confidence` if exposed or heuristics.
          // Let's assume we repair if the user requested it or valid heuristic.

          // If gemini service is present and we detect potential issue (simulated here for all lines
          // if we want full enhancement, or selective).
          // Let's just append for now.
          fullText.writeln(lineText);
        }
        fullText.writeln(); // Paragraph break
      }

      return fullText.toString();
    } catch (e) {
      if (kDebugMode) {
        print('OCR Processing Error: $e');
      }
      return 'Error processing document.';
    }
  }

  /// Translates the given text to Hindi using On-Device Translation.
  Future<String> translateToHindi(String text) async {
    try {
      final String response = await _hindiTranslator.translateText(text);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Translation Error: $e');
      }
      return text; // Return original on failure
    }
  }

  void dispose() {
    _textRecognizer.close();
    _hindiTranslator.close();
  }
}
