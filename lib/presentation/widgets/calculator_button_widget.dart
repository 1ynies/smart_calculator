import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_calculator/core/theme.dart';

class CalculatorButtonWidget extends StatelessWidget {
  final Widget content;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;

  const CalculatorButtonWidget({
    this.backgroundColor = const Color(0xFFede9fe),
    required this.content,
    required this.onPressed,
    this.width = 60.0,
    this.height = 60.0,
    this.borderRadius = 13.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final defaultColor = colorScheme.primaryContainer;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Material(
          color: backgroundColor,
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: width,
              height: height,
              child: Center(
                child: content, // The content widget is placed here
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EqualsButton extends StatelessWidget {
  final VoidCallback onPressed;
  

  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;

  const EqualsButton({
    this.backgroundColor = const Color(0xFFdfcdfd),
    
    required this.onPressed,
    this.width = 60.0,
    this.height = 60.0,
    this.borderRadius = 13.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Material(
          color: backgroundColor,
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: width,
              height: height,
              child: Center(
                child: SvgPicture.asset('assets/svg/equals.svg',width: 30,), // The content widget is placed here
              ),
            ),
          ),
        ),
      ),
    );
  }
}
