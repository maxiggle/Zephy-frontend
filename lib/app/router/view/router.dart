import 'dart:developer';

import 'package:fleetfi/app/router/view/error_page.dart';
import 'package:fleetfi/feature/authentication/view/confirm_phrase.dart';
import 'package:fleetfi/feature/authentication/view/recovery_phrase_page.dart';
import 'package:fleetfi/feature/onboarding/view/onboarding_page.dart';
import 'package:fleetfi/feature/splash/view/splash_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  log('Requested route: ${settings.name}');
  switch (settings.name) {
    case SplashPage.routeName:
      return _pageBuilder(
        (context) => const SplashPage(),
        settings: settings,
      );
    case OnBoardingCarousel.routeName:
      return _pageBuilder(
        (context) => const OnBoardingCarousel(),
        settings: settings,
      );
    case RecoveryPhrasePage.routeName:
      return _pageBuilder(
        (context) => const RecoveryPhrasePage(),
        settings: settings,
      );
    case ConfirmPhrasePage.routeName:
      return _pageBuilder(
        (context) => const ConfirmPhrasePage(),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (context) => const ErrorPage(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
