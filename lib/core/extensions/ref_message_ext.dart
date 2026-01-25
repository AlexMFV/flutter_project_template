import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:talk2me/core/ui/message_listener.dart';

extension MessageListenerX on WidgetRef {
  void listenMessages<T extends ChangeNotifier>(
    ChangeNotifierProvider<T> provider,
    BuildContext context,
  ) {
    listenToMessages(this, provider, context);
  }
}