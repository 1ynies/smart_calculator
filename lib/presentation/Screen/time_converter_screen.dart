import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_calculator/presentation/Screen/converter_screen.dart';
import 'package:smart_calculator/presentation/Screen/standard_converter_screen.dart';
import '../controller/converter_controller.dart';


class TimeConverterScreen extends StatelessWidget {
  final ConverterController controller;

  const TimeConverterScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,

              MaterialPageRoute(builder: (context) => ConverterScreen()),
            );
          },
          icon: SvgPicture.asset('assets/svg/chevron_left.svg'),
        ),
        title: const Text(
          'Time Converter',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StandardConverterWidget(controller: controller),
        ),
      ),
    );
  }
}
