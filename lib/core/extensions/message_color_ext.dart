import 'package:flutter/material.dart';
import 'package:talk2me/core/messages/message_types.dart';

extension MessageColorX on MessageType {
  Color color(BuildContext context) {
    switch (this) {
      case MessageType.success:
        return Colors.green;
      case MessageType.warning:
        return Colors.orange;
      case MessageType.error:
        return Colors.red;
      case MessageType.info:
        return Colors.blue;
    }
  }
}