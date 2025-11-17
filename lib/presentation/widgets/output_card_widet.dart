import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smart_calculator/presentation/controller/converter_controller.dart';

class OutputCardWidet extends StatelessWidget {
  final ConverterController controller;

  const OutputCardWidet({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: const Color(0xFFede9fe),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'To',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  controller.result.value,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: controller.hasError.value
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => DropdownButtonFormField<String>(
                value: controller.toUnit.value.isEmpty
                    ? null
                    : controller.toUnit.value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items: controller.availableUnits.map((unit) {
                  return DropdownMenuItem(
                    value: unit,
                    child: Text(
                      unit,
                      style: const TextStyle(fontFamily: 'Poppins'),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.setToUnit(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
