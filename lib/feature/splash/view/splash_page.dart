import 'package:fleetfi/feature/onboarding/view/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // late Storage _storage;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeStorage();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _initializeStorage() async {
    // _storage = Storage();
    // await _storage.init();
    // _navigateUser();
    Navigator.pushNamed(context, OnBoardingCarousel.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          children: [
            Image.asset(
              'assets/app_icon/fleet_logo.png',
              height: 300,
              width: 150,
            ),
            // Text('FleetFi', style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }

  _navigateUser() async {
    // final isOnboardingDone = await _storage.getBool(onboardingDone);
    // final isSignedIn =
    //     await context.read<AuthenticationProvider>().isSignedIn();

    // if (isSignedIn) {
    //   if (isOnboardingDone) {
    //     context.go('/main_activity');
    //   } else if (isOnboardingDone == false) {
    //     context.go('/upload_photo');
    //   } else {
    //     context.go('/onboarding');
    //   }
    // } else {
    //   context.go('/onboarding');
    // }
  }
}
