import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talk2me/core/constants/navigation_routes.dart';
import 'package:talk2me/core/services/service_providers.dart';
import 'package:talk2me/core/themes/theme.dart';
import 'package:talk2me/l10n/app_localizations.dart';
import 'package:talk2me/views/pages/home_page.dart';
import 'package:talk2me/views/pages/splash_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AppStart()
    )
  );
}

class AppStart extends ConsumerWidget {
  const AppStart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeVm = ref.watch(themeVMProvider);
    final localeVm = ref.watch(localeViewModelProvider);

    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeVm.mode,
      locale: localeVm.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      navigatorKey: navService.navigatorKey,
      initialRoute: Routes.SPLASHPAGE,
      routes: {
        //'/': (_) => LoginPage() or StartingGuidePage()
        Routes.HOMEPAGE: (_) => HomePage(),
        Routes.SPLASHPAGE: (_) => SplashPage(),
      },
    );
  }

}