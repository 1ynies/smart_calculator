import '../../domain/repository/calculator_repository.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  @override
  double add(double a, double b) {
    return a + b;
  }

  @override
  double subtract(double a, double b) {
    return a - b;
  }

  @override
  double multiply(double a, double b) {
    return a * b;
  }

  @override
  double divide(double a, double b) {
    if (b == 0) {
      throw Exception('Cannot divide by zero');
    }
    return a / b;
  }

  @override
  double percentage(double value, double percent) {
    return (value * percent) / 100;
  }

  @override
  double evaluateExpression(String expression) {
    try {
      // Remove spaces
      expression = expression.replaceAll(' ', '');

      // Handle empty expression
      if (expression.isEmpty) return 0;

      // Simple expression evaluator
      return _evaluate(expression);
    } catch (e) {
      throw Exception('Invalid expression: $e');
    }
  }

  double _evaluate(String expression) {
    // Handle parentheses first
    while (expression.contains('(')) {
      int start = expression.lastIndexOf('(');
      int end = expression.indexOf(')', start);
      if (end == -1) throw Exception('Mismatched parentheses');

      String subExpr = expression.substring(start + 1, end);
      double result = _evaluate(subExpr);
      expression =
          expression.substring(0, start) +
          result.toString() +
          expression.substring(end + 1);
    }

    // Handle multiplication and division
    expression = _handleMultiplicationAndDivision(expression);

    // Handle addition and subtraction
    return _handleAdditionAndSubtraction(expression);
  }

  String _handleMultiplicationAndDivision(String expression) {
    RegExp regex = RegExp(r'(-?\d+\.?\d*)([*/])(-?\d+\.?\d*)');

    while (regex.hasMatch(expression)) {
      Match match = regex.firstMatch(expression)!;
      double left = double.parse(match.group(1)!);
      String operator = match.group(2)!;
      double right = double.parse(match.group(3)!);

      double result;
      if (operator == '*') {
        result = left * right;
      } else {
        if (right == 0) throw Exception('Division by zero');
        result = left / right;
      }

      expression = expression.replaceFirst(match.group(0)!, result.toString());
    }

    return expression;
  }

  double _handleAdditionAndSubtraction(String expression) {
    // Split by + and - while keeping the operators
    List<String> tokens = [];
    String currentToken = '';

    for (int i = 0; i < expression.length; i++) {
      if ((expression[i] == '+' || expression[i] == '-') && i > 0) {
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken);
          currentToken = '';
        }
        tokens.add(expression[i]);
      } else {
        currentToken += expression[i];
      }
    }
    if (currentToken.isNotEmpty) {
      tokens.add(currentToken);
    }

    // Calculate result
    double result = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      if (i + 1 < tokens.length) {
        String operator = tokens[i];
        double operand = double.parse(tokens[i + 1]);

        if (operator == '+') {
          result += operand;
        } else if (operator == '-') {
          result -= operand;
        }
      }
    }

    return result;
  }
}
