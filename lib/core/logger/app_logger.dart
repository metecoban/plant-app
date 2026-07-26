import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

@lazySingleton
class AppLogger {
  AppLogger(this._talker);

  final Talker _talker;

  void debug(String message, [Object? data]) {
    _talker.debug(message, data);
  }

  void info(String message, [Object? data]) {
    _talker.info(message, data);
  }

  void warning(String message, [Object? data]) {
    _talker.warning(message, data);
  }

  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _talker.error(message, error, stackTrace);
  }
}
