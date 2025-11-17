import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_calculator/core/theme.dart';
import 'package:smart_calculator/domain/entities/converter.dart';
import 'package:smart_calculator/presentation/Screen/age_calculator_screen.dart';
import 'package:smart_calculator/presentation/Screen/data_converter_screen.dart';
import 'package:smart_calculator/presentation/Screen/discount_calculator_screen.dart';
import 'package:smart_calculator/presentation/Screen/temperature_converter_screen.dart';
import 'package:smart_calculator/presentation/Screen/time_converter_screen.dart';
import 'package:smart_calculator/presentation/Screen/volume_converter_screen.dart';
import 'package:smart_calculator/presentation/controller/converter_controller.dart';

import 'package:get/get.dart';

class ClickableSvgTextWidget extends StatefulWidget {
  final ConverterType type;
  final String svgPath; // Path to the SVG asset
  final String label; // Text to display
  final Color initialColor; // Initial background color
  final Color tappedColor; // Background color after tap

  const ClickableSvgTextWidget({
    Key? key,
    required this.type,
    required this.svgPath,
    required this.label,
    this.initialColor = Colors.white,
    this.tappedColor = const Color(0xFFdfcdfd),
  }) : super(key: key);

  @override
  _ClickableSvgTextWidgetState createState() => _ClickableSvgTextWidgetState();
}

class _ClickableSvgTextWidgetState extends State<ClickableSvgTextWidget> {
  final ConverterController controller = Get.put(ConverterController());

  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor; // Start with initial color
  }

  void _setToTappedColor() {
    setState(() {
      
      _currentColor = widget.tappedColor;
    });
  }


  void _resetToInitialColor() {
    setState(() {
      _currentColor = widget.initialColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _setToTappedColor();
        await Future.delayed(
          Duration(milliseconds: 6),
        ); // Pause to see the color change
       _navigateToConverter(widget.type);

        _resetToInitialColor();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: _currentColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        // Background color that toggles
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(widget.svgPath, width: 60, height: 60),

            SizedBox(height: 10),
            // Text wrapped in GestureDetector
            Text(
              widget.label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToConverter(ConverterType type) {
    // Set the converter type before navigation
    controller.changeConverterType(type);

    Widget screen;

    switch (type) {
      case ConverterType.volume:
        screen = VolumeConverterScreen(controller: controller);
        break;
      case ConverterType.time:
        screen = TimeConverterScreen(controller: controller);
        break;
      case ConverterType.data:
        screen = DataConverterScreen(controller: controller);
        break;
      case ConverterType.temperature:
        screen = TemperatureConverterScreen(controller: controller);
        break;
      case ConverterType.discount:
        screen = DiscountCalculatorScreen();
        break;
      case ConverterType.age:
        screen = AgeCalculatorScreen();
        break;
    }

    Get.to(() => screen);
  }
}
