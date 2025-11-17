import 'package:flutter/material.dart';
import 'package:smart_calculator/presentation/widgets/input_card_widget.dart';
import 'package:smart_calculator/presentation/widgets/output_card_widet.dart';
import '../controller/converter_controller.dart';

class StandardConverterWidget extends StatelessWidget {
  final ConverterController controller;

  const StandardConverterWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Input section
        InputCardWidget(controller: controller),
        const SizedBox(height: 16),

        // Swap button
        Center(
          child: IconButton(
            onPressed: () => controller.swapUnits(),
            icon: const Icon(Icons.swap_vert, size: 32),
          ),
        ),
        const SizedBox(height: 16),

        // Output section
        OutputCardWidet(controller: controller)
      ],
    );
  }
}
