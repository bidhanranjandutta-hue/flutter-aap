import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  test('Theme allocation benchmark', () {
    const int iterations = 10000;

    // Warmup
    for (int i = 0; i < 1000; i++) {
      final _ = AppTheme.lightTheme;
      final __ = AppTheme.darkTheme;
    }

    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      final _ = AppTheme.lightTheme;
    }
    stopwatch.stop();
    final lightTime = stopwatch.elapsedMicroseconds;

    stopwatch.reset();
    stopwatch.start();
    for (int i = 0; i < iterations; i++) {
      final _ = AppTheme.darkTheme;
    }
    stopwatch.stop();
    final darkTime = stopwatch.elapsedMicroseconds;

    print('--- BENCHMARK RESULTS ---');
    print('Iterations: $iterations');
    print('lightTheme total time: ${lightTime}us');
    print('darkTheme total time: ${darkTime}us');
    print('-------------------------');
  });
}
