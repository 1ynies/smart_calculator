import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_calculator/presentation/controller/calculator_controller.dart';
import 'package:smart_calculator/presentation/widgets/calculator_button_widget.dart';

class CalculatorScreen extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display area
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Expression display
                Obx(
                  () => Text(
                    controller.expression.value,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(height: 8),
                // Result display
                Obx(
                  () => Text(
                    controller.display.value,
                    style: TextStyle(
                      fontSize: 48,
                      // fontWeight: FontWeight.bold,
                      color: controller.hasError.value
                          ? Colors.red
                          : Colors.black,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Button grid
        Container(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 1.0,
            children: <Widget>[
              CalculatorButtonWidget(
                content: const Text(
                  "AC",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () => controller.onClearPressed(),
              ),
              CalculatorButtonWidget(
                content: SvgPicture.asset(
                  "assets/svg/backspace.svg",
                  width: 30,
                  height: 30,
                ),
                onPressed: () => controller.onBackspacePressed(),
              ),
              CalculatorButtonWidget(
                content: const Text(
                  "%",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                onPressed: () => controller.onPercentPressed(),
              ),
              CalculatorButtonWidget(
                content: SvgPicture.asset(
                  'assets/svg/slash.svg',
                  width: 30,
                  height: 30,
                ),
                onPressed: () => controller.onOperatorPressed('÷'),
              ),
              CalculatorButtonWidget(
                content: const Text("7", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('7'),
              ),
              CalculatorButtonWidget(
                content: const Text("8", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('8'),
              ),
              CalculatorButtonWidget(
                content: const Text("9", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('9'),
              ),
              CalculatorButtonWidget(
                content: const Text(
                  "×",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                onPressed: () => controller.onOperatorPressed('×'),
              ),
              CalculatorButtonWidget(
                content: const Text("4", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('4'),
              ),
              CalculatorButtonWidget(
                content: const Text("5", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('5'),
              ),
              CalculatorButtonWidget(
                content: const Text("6", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('6'),
              ),
              CalculatorButtonWidget(
                content: SvgPicture.asset(
                  'assets/svg/minus.svg',
                  width: 30,
                  height: 30,
                ),
                onPressed: () => controller.onOperatorPressed('-'),
              ),
              CalculatorButtonWidget(
                content: const Text("1", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('1'),
              ),
              CalculatorButtonWidget(
                content: const Text("2", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('2'),
              ),
              CalculatorButtonWidget(
                content: const Text("3", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('3'),
              ),
              CalculatorButtonWidget(
                content: SvgPicture.asset(
                  'assets/svg/plus.svg',
                  width: 30,
                  height: 30,
                ),
                onPressed: () => controller.onOperatorPressed('+'),
              ),
              CalculatorButtonWidget(
                content: Text(' '),
                // SvgPicture.asset(
                //   'assets/svg/arrow_pointing_out.svg',
                //   width: 30,
                //   height: 30,
                // ),
                onPressed: () => controller.onToggleSign(),
              ),
              CalculatorButtonWidget(
                content: const Text("0", style: TextStyle(fontSize: 24)),
                onPressed: () => controller.onNumberPressed('0'),
              ),
              CalculatorButtonWidget(
                content: const Text(
                  ".",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                onPressed: () => controller.onNumberPressed('.'),
              ),
              EqualsButton(onPressed: () => controller.onEqualsPressed()),
            ],
          ),
        ),
      ],
    );
  }
}
