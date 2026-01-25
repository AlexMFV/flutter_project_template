import 'package:flutter/material.dart';
import 'package:talk2me/core/logging/logger.dart';
import 'package:talk2me/core/messages/app_messages.dart';
import 'package:talk2me/core/messages/message_key.dart';
import 'package:talk2me/core/messages/message_types.dart';
import 'package:talk2me/core/services/navigation_service.dart';

class BaseViewModel extends ChangeNotifier {
  final NavigationService nav;
  final LoggerService logger;

  AppMessage? _message;
  AppMessage? get message => _message;

  BaseViewModel(this.nav, this.logger);

  void _emit(
    MessageType type,
    MessageKey key, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (type == MessageType.error) {
      logger.error('Error message: $key', error: error, stackTrace: stackTrace);
    } else {
      logger.info('Message: $key');
    }

    _message = AppMessage(type: type, key: key);
    notifyListeners();
  }

  // Public helpers (clean API)
  void success(MessageKey key) => _emit(MessageType.success, key);
  void info(MessageKey key) => _emit(MessageType.info, key);
  void warn(MessageKey key) => _emit(MessageType.warning, key);
  void fail(MessageKey key, {Object? error, StackTrace? stackTrace}) =>
      _emit(MessageType.error, key, error: error, stackTrace: stackTrace);

  void clearMessage() {
    _message = null;
    notifyListeners();
  }

  void navigateTo(String route, {Object? args}) => nav.navigateTo(route, args: args);

  void replaceWith(String route, {Object? args}) => nav.replace(route, args: args);

  void goBack() => nav.goBack();
}