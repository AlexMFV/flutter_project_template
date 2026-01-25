import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:talk2me/core/extensions/message_color_ext.dart';
import 'package:talk2me/core/extensions/message_l10n_ext.dart';
import 'package:talk2me/core/messages/app_messages.dart';

void listenToMessages<T extends ChangeNotifier>(
  WidgetRef ref,
  ChangeNotifierProvider<T> provider,
  BuildContext context,
) {
  ref.listen<T>(provider, (_, vm) {
    // We know all our VMs extend BaseViewModel
    final dynamic baseVm = vm;

    final AppMessage? message = baseVm.message;
    if (message == null) return;

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        backgroundColor: message.type.color(context),
        content: Text(
          context.messageText(message.key),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

    baseVm.clearMessage();
  });
}