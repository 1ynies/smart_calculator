import 'package:flutter/material.dart';
import '../controller/converter_controller.dart';
import 'standard_converter_screen.dart';

class DataConverterWidget extends StatelessWidget {
  final ConverterController controller;

  const DataConverterWidget({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardConverterWidget(controller: controller);
  }
}
