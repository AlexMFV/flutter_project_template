import 'package:flutter/material.dart';

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<void> navigateTo(String route, {Object? args}) {
    return navigatorKey.currentState!.pushNamed(route, arguments: args);
  }

  void replace(String route, {Object? args}) {
    navigatorKey.currentState!.pushReplacementNamed(route, arguments: args);
  }

  void goBack() {
    navigatorKey.currentState!.pop();
  }
}