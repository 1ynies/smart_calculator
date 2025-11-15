import '../entities/converter.dart';
import '../repository/converter_repository.dart';

class ConvertUnit {
  final ConverterRepository repository;

  ConvertUnit(this.repository);

  Converter execute({
    required ConverterType type,
    required double value,
    required String fromUnit,
    required String toUnit,
  }) {
    double result;

    switch (type) {
      case ConverterType.volume:
        result = repository.convertVolume(value, fromUnit, toUnit);
        break;
      case ConverterType.time:
        result = repository.convertTime(value, fromUnit, toUnit);
        break;
      case ConverterType.data:
        result = repository.convertData(value, fromUnit, toUnit);
        break;
      case ConverterType.temperature:
        result = repository.convertTemperature(value, fromUnit, toUnit);
        break;
      case ConverterType.discount:
        result = repository.convertDiscount(value, double.parse(toUnit));
        break;
      case ConverterType.age:
        // Age is handled differently, returning 0 as placeholder
        result = 0;
        break;
    }

    return Converter(
      type: type,
      fromUnit: fromUnit,
      toUnit: toUnit,
      value: value,
      result: result,
    );
  }

  List<String> getUnitsForType(ConverterType type) {
    return repository.getUnitsForType(type);
  }

  Map<String, int> calculateAge(DateTime birthDate) {
    return repository.convertAge(birthDate, DateTime.now());
  }
}
