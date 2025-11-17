import 'package:flutter/material.dart';
import 'package:smart_calculator/presentation/Screen/standard_converter_screen.dart';
import '../controller/converter_controller.dart';


class VolumeConverterScreen extends StatelessWidget {
  final ConverterController controller;

  const VolumeConverterScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Volume Converter',
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
