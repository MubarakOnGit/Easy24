import 'package:logger/logger.dart';

class LoggerHelper {
  static final Logger _logger = Logger(printer: PrettyPrinter());

  // Debug log
  static void debug(String message) {
    _logger.d(message);
  }

  // Info log
  static void info(String message) {
    _logger.i(message);
  }

  // Warning log
  static void warning(String message) {
    _logger.w(message);
  }

  // Error log
  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }
}
