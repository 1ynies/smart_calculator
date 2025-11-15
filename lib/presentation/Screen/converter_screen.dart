import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/converter_controller.dart';
import '../../domain/entities/converter.dart';
import 'volume_converter_screen.dart';
import 'time_converter_screen.dart';
import 'data_converter_screen.dart';
import 'temperature_converter_screen.dart';
import 'discount_calculator_screen.dart';
import 'age_calculator_screen.dart';

class ConverterScreen extends StatelessWidget {
  final ConverterController controller = Get.put(ConverterController());

  ConverterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Converter type selector
              _buildConverterTypeSelector(),
              const SizedBox(height: 24),

              // Main converter content
              Expanded(child: Obx(() => _getConverterWidget())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConverterTypeSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ConverterType.values.map((type) {
            return Obx(
              () => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(controller.getConverterTypeName(type)),
                  selected: controller.selectedType.value == type,
                  onSelected: (selected) {
                    if (selected) {
                      controller.changeConverterType(type);
                    }
                  },
                  selectedColor: const Color(0xFFe1bee7),
                  backgroundColor: const Color(0xFFf3e5f5),
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: controller.selectedType.value == type
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _getConverterWidget() {
    switch (controller.selectedType.value) {
      case ConverterType.volume:
        return VolumeConverterWidget(controller: controller);
      case ConverterType.time:
        return TimeConverterWidget(controller: controller);
      case ConverterType.data:
        return DataConverterWidget(controller: controller);
      case ConverterType.temperature:
        return TemperatureConverterWidget(controller: controller);
      case ConverterType.discount:
        return DiscountCalculatorWidget(controller: controller);
      case ConverterType.age:
        return AgeCalculatorWidget(controller: controller);
      default:
        return VolumeConverterWidget(controller: controller);
    }
  }
}
