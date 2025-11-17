import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_calculator/presentation/Screen/standard_converter_screen.dart';
import '../controller/converter_controller.dart';
import '../../domain/entities/converter.dart';

class VolumeConverterScreen extends StatelessWidget {
  final ConverterController controller;

  const VolumeConverterScreen({Key? key, required this.controller})
    : super(key: key);

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
