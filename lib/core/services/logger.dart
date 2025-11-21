class Logger {
  Logger._();

  static bool _enabled = false;

  static void enable() {
    _enabled = true;
  }

  static void disable() {
    _enabled = false;
  }

  static void info(String message) {
    if (_enabled) {
      // ignore: avoid_print
      print('[INFO] $message');
    }
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    if (_enabled) {
      // ignore: avoid_print
      print('[ERROR] $message');
      if (error != null) {
        // ignore: avoid_print
        print('[ERROR] Error: $error');
      }
      if (stackTrace != null) {
        // ignore: avoid_print
        print('[ERROR] StackTrace: $stackTrace');
      }
    }
  }

  static void debug(String message) {
    if (_enabled) {
      // ignore: avoid_print
      print('[DEBUG] $message');
    }
  }
}
