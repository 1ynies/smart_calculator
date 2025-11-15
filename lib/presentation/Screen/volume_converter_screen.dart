import 'package:flutter/material.dart';
import '../controller/converter_controller.dart';
import 'standard_converter_screen.dart';

class VolumeConverterWidget extends StatelessWidget {
  final ConverterController controller;

  const VolumeConverterWidget({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardConverterWidget(controller: controller);
  }
}
