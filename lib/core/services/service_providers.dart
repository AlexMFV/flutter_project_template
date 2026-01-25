import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:talk2me/core/logging/logger.dart';
import 'package:talk2me/core/services/navigation_service.dart';
import 'package:talk2me/viewmodels/home_viewmodel.dart';
import 'package:talk2me/viewmodels/l10n_viewmodel.dart';
import 'package:talk2me/viewmodels/theme_viewmodel.dart';

final NavigationService navService = NavigationService();

final themeVMProvider = ChangeNotifierProvider<ThemeViewModel>((ref) {
  return ThemeViewModel();
});

final loggerProvider = Provider<LoggerService>((ref) {
  return LoggerService();
});

final localeViewModelProvider =
    ChangeNotifierProvider<L10nViewModel>((ref) {
  return L10nViewModel();
});

final navProvider = Provider<NavigationService>((ref) {
  return navService;
});

final homeVMProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  final nav = ref.read(navProvider);
  final logger = ref.read(loggerProvider);
  return HomeViewModel(nav, logger);
});