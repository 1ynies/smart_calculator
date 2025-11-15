import '../../domain/entities/calculation.dart';

class CalculationModel extends Calculation {
  CalculationModel({
    required super.expression,
    required super.result,
    required super.timestamp,
  });

  factory CalculationModel.fromEntity(Calculation calculation) {
    return CalculationModel(
      expression: calculation.expression,
      result: calculation.result,
      timestamp: calculation.timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expression': expression,
      'result': result,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory CalculationModel.fromJson(Map<String, dynamic> json) {
    return CalculationModel(
      expression: json['expression'],
      result: json['result'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
