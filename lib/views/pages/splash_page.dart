import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talk2me/core/constants/navigation_routes.dart';
import 'package:talk2me/core/services/service_providers.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() {
      ref.read(navProvider).replace(Routes.HOMEPAGE);
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}