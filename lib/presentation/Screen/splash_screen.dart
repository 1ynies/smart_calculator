import 'package:flutter/material.dart';
import 'dart:async';

import 'package:smart_calculator/presentation/Screen/homepage_screen.dart';

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
        MaterialPageRoute(builder: (BuildContext context) => HomepageScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset("assets/images/appicon_backgroundless.png"),
            ),
          ],
        ),
      ),
    );
  }
}
