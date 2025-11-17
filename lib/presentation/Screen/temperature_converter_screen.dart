import 'package:flutter/material.dart';
import 'package:smart_calculator/presentation/Screen/standard_converter_screen.dart';
import '../controller/converter_controller.dart';

class TemperatureConverterScreen extends StatelessWidget {
  final ConverterController controller;

  const TemperatureConverterScreen({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temperature Converter',
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

class TemperatureConverterWidget extends StatelessWidget {
  final ConverterController controller;

  const TemperatureConverterWidget({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardConverterWidget(controller: controller);
  }
}
