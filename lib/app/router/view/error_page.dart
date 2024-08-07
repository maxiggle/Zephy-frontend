import 'package:fleetfi/feature/onboarding/view/onboarding_page.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const routeName = '/error';
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              Navigator.pushNamed(context, OnBoardingCarousel.routeName),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
