import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60),
            Container(
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
              child: Image.asset(
                'lib/presentation/assets/images/robot_holding_calculator_backgroundless.png',
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 250,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xFFFFC727), // Yellow-orange background
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "Agrandir",
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
