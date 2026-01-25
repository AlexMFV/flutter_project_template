import 'dart:developer' as dev;

class LoggerService {
  void info(String message) {
    dev.log(message, level: 800);
  }

  void warning(String message) {
    dev.log(message, level: 900);
  }

  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    dev.log(
      message,
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}