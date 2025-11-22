import 'package:flutter/material.dart';
import 'package:smart_calculator/presentation/widgets/Clickable_converter_widget.dart';
import '../../domain/entities/converter.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 3,
            children: [
              ClickableSvgTextWidget(
                type: ConverterType.volume,
                svgPath: 'assets/svg/funnel.svg',
                label: 'Volume',
              ),
              ClickableSvgTextWidget(
                type: ConverterType.data,
                svgPath: 'assets/svg/server.svg',
                label: 'Data',
              ),
              ClickableSvgTextWidget(
                type: ConverterType.age,
                svgPath: 'assets/svg/age.svg',
                label: 'Age',
              ),
              ClickableSvgTextWidget(
                type: ConverterType.discount,
                svgPath: 'assets/svg/percent.svg',
                label: 'Discount',
              ),
              ClickableSvgTextWidget(
                type: ConverterType.time,
                svgPath: 'assets/svg/clock.svg',
                label: 'Time',
              ),
              ClickableSvgTextWidget(
                type: ConverterType.temperature,
                svgPath: 'assets/svg/temperature.svg',
                label: 'Temp',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
