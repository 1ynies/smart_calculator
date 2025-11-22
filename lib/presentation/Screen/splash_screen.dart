import 'package:flutter/material.dart';
import 'dart:async';
import 'package:smart_calculator/presentation/Screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    Timer(const Duration(seconds: 3), () {
      // Navigate to the main screen after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/appicon_backgroundless.png',

                  width: 150,

                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),

              child: Text(
                'Smart calculator',

                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
