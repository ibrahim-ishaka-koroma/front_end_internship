import 'dart:developer' as developer;

class Logger {
  static void log(String message) {
    final time = DateTime.now().toIso8601String();
    developer.log('[$time] $message');
  }
}
