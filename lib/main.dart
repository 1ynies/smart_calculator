import 'package:flutter/material.dart';
import 'package:smart_calculator/core/theme.dart';
import 'package:smart_calculator/presentation/Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      
      home: SplashScreen(),
    );
  }
}


