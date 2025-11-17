import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/converter_controller.dart';

class AgeCalculatorScreen extends StatelessWidget {
  const AgeCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ConverterController controller = Get.find<ConverterController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Age Calculator',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AgeCalculatorWidget(controller: controller),
        ),
      ),
    );
  }
}

class AgeCalculatorWidget extends StatelessWidget {
  final ConverterController controller;

  const AgeCalculatorWidget({super.key, required this.controller});

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
                    // tileColor: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    leading: const Icon(
                      Icons.calendar_today,
                      color:   Color(0xFFede9fe),
                    ),
                    title: Text(
                      controller.selectedBirthDate.value == null
                          ? 'Tap to select date'
                          : '${controller.selectedBirthDate.value!.day}/${controller.selectedBirthDate.value!.month}/${controller.selectedBirthDate.value!.year}',
                      style: const TextStyle(fontFamily: 'Poppins'),
                    ),
                    onTap: () => _showCustomDatePicker(context),
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
            color: const Color(0xFFede9fe),
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

  void _showCustomDatePicker(BuildContext context) {
    DateTime selectedDate =
        controller.selectedBirthDate.value ??
        DateTime.now().subtract(const Duration(days: 365 * 20));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFede9fe),
          title: const Text('Select Date',style: TextStyle(color: Colors.black87),),
          content: SizedBox(
            height: 300,
            width: 300,
            child: CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              onDateChanged: (DateTime date) {
                selectedDate = date;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel',style: TextStyle(color: Colors.black87),),
            ),
            TextButton(
              onPressed: () {
                print('Picked date: $selectedDate');
                controller.calculateAge(selectedDate);
                Navigator.of(context).pop();
              },
              child: const Text('OK',style: TextStyle(color: Colors.black87),),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAgeItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 32,
            // fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color:  Colors.black,
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
