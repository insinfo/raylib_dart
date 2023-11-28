import 'package:raylib_dart/raylib_dart.dart';
import 'package:raylib_dart/src/library.dart';
import 'package:raylib_dart/src/utils/string.dart' as string;

/// Takes a screenshot of current screen (filename extension defines format).
void takeScreenshot(String fileName) {
  return library.TakeScreenshot(string.toNativeString(fileName));
}

/// Setup init configuration flags.
///
/// View [ConfigFlags] for more info.
void setConfigFlags(int flags) {
  return library.SetConfigFlags(flags);
}

/// Show trace log messages.
///
/// View [TraceLogLevel] for more info.
void traceLog(int logLevel, Object object) {
  return library.TraceLog(logLevel, string.toNativeString(object.toString()));
}

/// Set the current threshold (minimum) log level.
///
/// View [TraceLogLevel] for more info.
void setTraceLogLevel(int logLevel) {
  return library.SetConfigFlags(logLevel);
}
