import '../entities/converter.dart';

abstract class ConverterRepository {
  double convertVolume(double value, String fromUnit, String toUnit);
  double convertTime(double value, String fromUnit, String toUnit);
  double convertDiscount(double originalPrice, double discountPercent);
  double convertData(double value, String fromUnit, String toUnit);
  double convertTemperature(double value, String fromUnit, String toUnit);
  Map<String, int> convertAge(DateTime birthDate, DateTime currentDate);
  List<String> getUnitsForType(ConverterType type);
}
