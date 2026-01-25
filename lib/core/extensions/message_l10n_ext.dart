import 'package:flutter/material.dart';
import 'package:talk2me/core/messages/message_key.dart';
import 'package:talk2me/l10n/app_localizations.dart';

extension MessageLocalizationX on BuildContext {
  String messageText(MessageKey key) {
    final l10n = AppLocalizations.of(this)!;

    switch (key) {
      case MessageKey.sampleWarning:
        return l10n.sampleWarning;
      case MessageKey.sampleInfo:
        return l10n.sampleInfo;
      case MessageKey.sampleError:
        return l10n.sampleError;
      case MessageKey.sampleSuccess:
        return l10n.sampleSuccess;
    }
  }
}