enum ConverterType { volume, time, discount, data, temperature, age }

class Converter {
  final ConverterType type;
  final String fromUnit;
  final String toUnit;
  final double value;
  final double result;

  Converter({
    required this.type,
    required this.fromUnit,
    required this.toUnit,
    required this.value,
    required this.result,
  });
}
