import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/converter_controller.dart';

class AgeCalculatorWidget extends StatelessWidget {
  final ConverterController controller;

  const AgeCalculatorWidget({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Birth Date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => ListTile(
                    tileColor: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    leading: const Icon(
                      Icons.calendar_today,
                      color: Color(0xFF9c27b0),
                    ),
                    title: Text(
                      controller.selectedBirthDate.value == null
                          ? 'Tap to select date'
                          : '${controller.selectedBirthDate.value!.day}/${controller.selectedBirthDate.value!.month}/${controller.selectedBirthDate.value!.year}',
                      style: const TextStyle(fontFamily: 'Poppins'),
                    ),
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: Get.context!,
                        initialDate: DateTime.now().subtract(
                          const Duration(days: 365 * 20),
                        ),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        controller.calculateAge(picked);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Obx(() {
          if (controller.ageResult.isEmpty) {
            return const SizedBox.shrink();
          }
          return Card(
            elevation: 2,
            color: const Color(0xFFf3e5f5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    'Your Age',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildAgeItem(
                        'Years',
                        controller.ageResult['years'].toString(),
                      ),
                      _buildAgeItem(
                        'Months',
                        controller.ageResult['months'].toString(),
                      ),
                      _buildAgeItem(
                        'Days',
                        controller.ageResult['days'].toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Total: ${controller.ageResult['totalDays']} days',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildAgeItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xFF9c27b0),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
