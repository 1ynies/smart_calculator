import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_calculator/presentation/Screen/homepage_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60),
            Image.asset(
              'assets/images/robot_holding_calculator_backgroundless.png',
            ),

            Spacer(),
            Container(
              width: double.infinity,
              height: 220,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xFFaf90fc), // Yellow-orange background
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Calculate and convert smartly \n with smart calculator',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Poppins",
                    ),
                  ),

                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomepageScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Get started',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset('assets/svg/arrow-left.svg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
