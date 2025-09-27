import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error,
  fatal,
}

class AppLogger {
  static AppLogger? _instance;
  static AppLogger get instance => _instance ??= AppLogger._();
  
  AppLogger._();
  
  static void init() {
    _instance = AppLogger._();
  }

  void log(
    String message, {
    LogLevel level = LogLevel.info,
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? data,
  }) {
    if (!kDebugMode && level == LogLevel.debug) return;

    final timestamp = DateTime.now().toIso8601String();
    final logTag = tag ?? 'AppLogger';
    final logMessage = '[$timestamp] [$logTag] $message';

    switch (level) {
      case LogLevel.debug:
        developer.log(
          logMessage,
          name: logTag,
          level: 500,
          error: error,
          stackTrace: stackTrace,
        );
        break;
      case LogLevel.info:
        developer.log(
          logMessage,
          name: logTag,
          level: 800,
          error: error,
          stackTrace: stackTrace,
        );
        break;
      case LogLevel.warning:
        developer.log(
          logMessage,
          name: logTag,
          level: 900,
          error: error,
          stackTrace: stackTrace,
        );
        break;
      case LogLevel.error:
        developer.log(
          logMessage,
          name: logTag,
          level: 1000,
          error: error,
          stackTrace: stackTrace,
        );
        if (kReleaseMode) {
          FirebaseCrashlytics.instance.recordError(
            error ?? Exception(message),
            stackTrace,
            fatal: false,
            information: data?.entries
                .map((e) => DiagnosticsProperty(e.key, e.value))
                .toList(),
          );
        }
        break;
      case LogLevel.fatal:
        developer.log(
          logMessage,
          name: logTag,
          level: 1200,
          error: error,
          stackTrace: stackTrace,
        );
        if (kReleaseMode) {
          FirebaseCrashlytics.instance.recordError(
            error ?? Exception(message),
            stackTrace,
            fatal: true,
            information: data?.entries
                .map((e) => DiagnosticsProperty(e.key, e.value))
                .toList(),
          );
        }
        break;
    }
  }

  void debug(String message, {String? tag, Map<String, dynamic>? data}) {
    log(message, level: LogLevel.debug, tag: tag, data: data);
  }

  void info(String message, {String? tag, Map<String, dynamic>? data}) {
    log(message, level: LogLevel.info, tag: tag, data: data);
  }

  void warning(String message, {String? tag, Map<String, dynamic>? data}) {
    log(message, level: LogLevel.warning, tag: tag, data: data);
  }

  void error(
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? data,
  }) {
    log(
      message,
      level: LogLevel.error,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
      data: data,
    );
  }

  void fatal(
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? data,
  }) {
    log(
      message,
      level: LogLevel.fatal,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
      data: data,
    );
  }
}
