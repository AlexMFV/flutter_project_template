import 'package:flutter/material.dart';
import 'package:talk2me/l10n/app_localizations.dart';

extension LocalizationX on BuildContext {
  AppLocalizations get texts => AppLocalizations.of(this)!;
}