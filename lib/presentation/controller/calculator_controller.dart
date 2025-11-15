import 'package:get/get.dart';
import '../../data/repositories/calculator_repository_impl.dart';
import '../../domain/usecases/calculate.dart';

class CalculatorController extends GetxController {
  final Calculate _calculate = Calculate(CalculatorRepositoryImpl());

  // Observable variables
  final RxString display = '0'.obs;
  final RxString expression = ''.obs;
  final RxBool hasError = false.obs;

  // Internal state
  String _currentNumber = '';
  String _operator = '';
  double? _firstOperand;
  bool _shouldResetDisplay = false;

  void onNumberPressed(String number) {
    hasError.value = false;

    if (_shouldResetDisplay) {
      _currentNumber = '';
      _shouldResetDisplay = false;
    }

    // Handle decimal point
    if (number == '.') {
      if (_currentNumber.isEmpty) {
        _currentNumber = '0.';
      } else if (!_currentNumber.contains('.')) {
        _currentNumber += '.';
      }
    } else {
      if (_currentNumber == '0' && number != '.') {
        _currentNumber = number;
      } else {
        _currentNumber += number;
      }
    }

    display.value = _currentNumber;
  }

  void onOperatorPressed(String operator) {
    if (_currentNumber.isEmpty && _firstOperand == null) return;

    hasError.value = false;

    if (_firstOperand != null &&
        _currentNumber.isNotEmpty &&
        _operator.isNotEmpty) {
      // Calculate intermediate result
      _calculateResult();
    }

    if (_currentNumber.isNotEmpty) {
      _firstOperand = double.tryParse(_currentNumber);
    }

    _operator = operator;
    _currentNumber = '';
    expression.value = '${_firstOperand ?? ''} $_operator';
  }

  void onEqualsPressed() {
    if (_firstOperand == null || _currentNumber.isEmpty || _operator.isEmpty) {
      return;
    }

    hasError.value = false;
    _calculateResult();

    // Reset for next calculation
    _operator = '';
    _firstOperand = null;
    _shouldResetDisplay = true;
    expression.value = '';
  }

  void _calculateResult() {
    if (_firstOperand == null || _currentNumber.isEmpty) return;

    try {
      double secondOperand = double.parse(_currentNumber);
      double result;

      switch (_operator) {
        case '+':
          result = _calculate.add(_firstOperand!, secondOperand);
          break;
        case '-':
          result = _calculate.subtract(_firstOperand!, secondOperand);
          break;
        case '×':
        case '*':
          result = _calculate.multiply(_firstOperand!, secondOperand);
          break;
        case '÷':
        case '/':
          result = _calculate.divide(_firstOperand!, secondOperand);
          break;
        case '%':
          result = _calculate.percentage(_firstOperand!, secondOperand);
          break;
        default:
          return;
      }

      // Format result
      if (result == result.toInt()) {
        display.value = result.toInt().toString();
        _currentNumber = result.toInt().toString();
      } else {
        display.value = result
            .toStringAsFixed(8)
            .replaceAll(RegExp(r'0*$'), '')
            .replaceAll(RegExp(r'\.$'), '');
        _currentNumber = display.value;
      }

      _firstOperand = result;
    } catch (e) {
      display.value = 'Error';
      hasError.value = true;
      _currentNumber = '';
      _firstOperand = null;
      _operator = '';
    }
  }

  void onClearPressed() {
    display.value = '0';
    expression.value = '';
    _currentNumber = '';
    _operator = '';
    _firstOperand = null;
    hasError.value = false;
    _shouldResetDisplay = false;
  }

  void onBackspacePressed() {
    if (_currentNumber.isNotEmpty) {
      _currentNumber = _currentNumber.substring(0, _currentNumber.length - 1);
      display.value = _currentNumber.isEmpty ? '0' : _currentNumber;
    }
  }

  void onPercentPressed() {
    if (_currentNumber.isNotEmpty) {
      try {
        double value = double.parse(_currentNumber);
        double result = value / 100;

        if (result == result.toInt()) {
          display.value = result.toInt().toString();
          _currentNumber = result.toInt().toString();
        } else {
          display.value = result.toString();
          _currentNumber = result.toString();
        }
      } catch (e) {
        display.value = 'Error';
        hasError.value = true;
      }
    }
  }

  void onToggleSign() {
    if (_currentNumber.isNotEmpty && _currentNumber != '0') {
      if (_currentNumber.startsWith('-')) {
        _currentNumber = _currentNumber.substring(1);
      } else {
        _currentNumber = '-$_currentNumber';
      }
      display.value = _currentNumber;
    }
  }
}
