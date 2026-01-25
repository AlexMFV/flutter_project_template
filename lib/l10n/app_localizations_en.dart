// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get sampleError => 'This is a sample error message.';

  @override
  String get sampleWarning => 'This is a sample warning message.';

  @override
  String get sampleInfo => 'This is a sample informational message.';

  @override
  String get sampleSuccess => 'The operation was completed successfully.';
}
