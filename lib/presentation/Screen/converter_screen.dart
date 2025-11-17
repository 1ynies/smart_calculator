import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_calculator/presentation/widgets/Clickable_converter_widget.dart';
import '../controller/converter_controller.dart';
import '../../domain/entities/converter.dart';

class ConverterScreen extends StatelessWidget {
  ConverterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 3.0,
            crossAxisCount: 3,
            children: [
              ClickableSvgTextWidget(
                type: ConverterType.volume,
                svgPath: 'assets/svg/cube/svg',
                label: 'Voulme',
              ),
              ClickableSvgTextWidget(
                type: ConverterType.data,
                svgPath: 'assets/svg/cloud.svg',
                label: 'Data',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
