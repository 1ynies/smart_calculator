import '../entities/calculation.dart';
import '../repository/calculator_repository.dart';

class Calculate {
  final CalculatorRepository repository;

  Calculate(this.repository);

  Calculation execute(String expression) {
    final result = repository.evaluateExpression(expression);
    return Calculation(
      expression: expression,
      result: result,
      timestamp: DateTime.now(),
    );
  }

  double add(double a, double b) => repository.add(a, b);
  double subtract(double a, double b) => repository.subtract(a, b);
  double multiply(double a, double b) => repository.multiply(a, b);
  double divide(double a, double b) => repository.divide(a, b);
  double percentage(double value, double percent) =>
      repository.percentage(value, percent);
}
