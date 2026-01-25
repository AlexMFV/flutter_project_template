import 'package:talk2me/core/messages/message_key.dart';
import 'package:talk2me/core/messages/message_types.dart';

class AppMessage {
  final MessageType type;
  final MessageKey key;

  const AppMessage({
    required this.type,
    required this.key,
  });
}