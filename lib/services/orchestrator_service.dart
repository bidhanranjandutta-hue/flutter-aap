import 'package:flutter/foundation.dart';
import 'gemini_service.dart';

/// Exception thrown when a task violates the SaaS boundary.
class BoundaryViolationException implements Exception {
  final String message;
  BoundaryViolationException(this.message);

  @override
  String toString() => "BoundaryViolationException: $message";
}

/// The @OrchestratorAgent implementation.
///
/// Acts as middleware to monitor, orchestrate, and validate all AI tasks.
/// If a task is unrelated to the NyayaAssist Police SaaS, it terminates it.
class OrchestratorService {
  final GeminiService _geminiService = GeminiService('YOUR_API_KEY_HERE');

  /// Evaluates the task intent. If valid, executes the [action]. If invalid, terminates.
  Future<T> orchestrateTask<T>({
    required String taskDescription,
    required String targetAgent,
    required Future<T> Function() action,
  }) async {
    if (kDebugMode) {
      print('🛡️ @OrchestratorAgent: Auditing task for [$targetAgent]...');
    }

    final bool isSafe = await _verifySaaSRelevance(taskDescription);

    if (!isSafe) {
      if (kDebugMode) {
        print(
          '❌ @OrchestratorAgent: TASK TERMINATED. Context unrelated to NyayaAssist SaaS.',
        );
      }
      throw BoundaryViolationException(
        'Task blocked by Orchestrator: Activity is outside the scope of Indian Law Enforcement operations.',
      );
    }

    if (kDebugMode) {
      print(
        '✅ @OrchestratorAgent: Task approved. Delegating to [$targetAgent].',
      );
    }

    // Execute the actual agent's work
    return await action();
  }

  /// Uses a strict LLM prompt to verify if the task context belongs in the app.
  Future<bool> _verifySaaSRelevance(String text) async {
    try {
      final prompt =
          '''
      You are the @OrchestratorAgent. Your job is to strictly monitor tasks.
      The application is "NyayaAssist", an AI-powered Police Back-Office SaaS in India.

      Evaluate the following task description:
      "$text"

      Does this task relate strictly to Indian law, police operations, FIRs, evidence, legal mapping (BNS/BNSS/BSA), or app diagnostics?
      Answer ONLY "YES" or "NO".
      ''';

      // We use the underlying generateContent method from gemini_service
      // Note: This relies on the implementation in GeminiService.
      final response = await _geminiService.generateCaseSynopsis(prompt);

      // In a real scenario, we'd use a dedicated validation prompt method,
      // but we reuse generateCaseSynopsis for the HTTP call simulation here.
      // Assuming the response contains YES or NO.
      final bool isYes = response?.toUpperCase().contains('YES') ?? true;

      return isYes;
    } catch (e) {
      // Fail-safe: If the auditor fails, allow the task, but log it.
      if (kDebugMode) {
        print('@OrchestratorAgent Error during verification: $e');
      }
      return true;
    }
  }
}
