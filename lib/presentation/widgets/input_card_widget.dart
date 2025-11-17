import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smart_calculator/presentation/controller/converter_controller.dart';

class InputCardWidget extends StatelessWidget {
  final ConverterController controller;

  const InputCardWidget({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'From',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              cursorColor: Colors.black87,
              maxLines: 1,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              style: const TextStyle(fontSize: 24, fontFamily: 'Poppins'),
              decoration: const InputDecoration(
                filled: true,
                fillColor: const Color(0xFFede9fe),
                floatingLabelStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black87,
                    width: 1,
                  ), // Border when focused
                ),

                labelText: 'Enter value',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  // borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onChanged: (value) => controller.setInputValue(value),
            ),
            const SizedBox(height: 12),
            Obx(
              () => DropdownButtonFormField<String>(
                value: controller.fromUnit.value.isEmpty
                    ? null
                    : controller.fromUnit.value,
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
                    controller.setFromUnit(value);
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
