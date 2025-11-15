import '../../domain/entities/converter.dart';
import '../../domain/repository/converter_repository.dart';

class ConverterRepositoryImpl implements ConverterRepository {
  // Volume conversion rates to liters
  final Map<String, double> _volumeRates = {
    'Liters': 1.0,
    'Milliliters': 0.001,
    'Gallons': 3.78541,
    'Quarts': 0.946353,
    'Pints': 0.473176,
    'Cups': 0.236588,
    'Fluid Ounces': 0.0295735,
  };

  // Time conversion rates to seconds
  final Map<String, double> _timeRates = {
    'Seconds': 1.0,
    'Minutes': 60.0,
    'Hours': 3600.0,
    'Days': 86400.0,
    'Weeks': 604800.0,
    'Months': 2592000.0, // Approximate (30 days)
    'Years': 31536000.0, // Approximate (365 days)
  };

  // Data conversion rates to bytes
  final Map<String, double> _dataRates = {
    'Bytes': 1.0,
    'Kilobytes': 1024.0,
    'Megabytes': 1048576.0,
    'Gigabytes': 1073741824.0,
    'Terabytes': 1099511627776.0,
  };

  @override
  double convertVolume(double value, String fromUnit, String toUnit) {
    if (!_volumeRates.containsKey(fromUnit) ||
        !_volumeRates.containsKey(toUnit)) {
      throw Exception('Invalid volume unit');
    }

    // Convert to base unit (liters) then to target unit
    double inLiters = value * _volumeRates[fromUnit]!;
    return inLiters / _volumeRates[toUnit]!;
  }

  @override
  double convertTime(double value, String fromUnit, String toUnit) {
    if (!_timeRates.containsKey(fromUnit) || !_timeRates.containsKey(toUnit)) {
      throw Exception('Invalid time unit');
    }

    // Convert to base unit (seconds) then to target unit
    double inSeconds = value * _timeRates[fromUnit]!;
    return inSeconds / _timeRates[toUnit]!;
  }

  @override
  double convertDiscount(double originalPrice, double discountPercent) {
    if (discountPercent < 0 || discountPercent > 100) {
      throw Exception('Discount percent must be between 0 and 100');
    }

    double discountAmount = (originalPrice * discountPercent) / 100;
    return originalPrice - discountAmount;
  }

  @override
  double convertData(double value, String fromUnit, String toUnit) {
    if (!_dataRates.containsKey(fromUnit) || !_dataRates.containsKey(toUnit)) {
      throw Exception('Invalid data unit');
    }

    // Convert to base unit (bytes) then to target unit
    double inBytes = value * _dataRates[fromUnit]!;
    return inBytes / _dataRates[toUnit]!;
  }

  @override
  double convertTemperature(double value, String fromUnit, String toUnit) {
    // First convert to Celsius
    double celsius;

    switch (fromUnit) {
      case 'Celsius':
        celsius = value;
        break;
      case 'Fahrenheit':
        celsius = (value - 32) * 5 / 9;
        break;
      case 'Kelvin':
        celsius = value - 273.15;
        break;
      default:
        throw Exception('Invalid temperature unit');
    }

    // Then convert from Celsius to target unit
    switch (toUnit) {
      case 'Celsius':
        return celsius;
      case 'Fahrenheit':
        return (celsius * 9 / 5) + 32;
      case 'Kelvin':
        return celsius + 273.15;
      default:
        throw Exception('Invalid temperature unit');
    }
  }

  @override
  Map<String, int> convertAge(DateTime birthDate, DateTime currentDate) {
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    // Adjust if current month/day is before birth month/day
    if (days < 0) {
      months--;
      // Get days in previous month
      DateTime previousMonth = DateTime(
        currentDate.year,
        currentDate.month - 1,
      );
      days += DateTime(previousMonth.year, previousMonth.month + 1, 0).day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    // Calculate total days
    int totalDays = currentDate.difference(birthDate).inDays;

    return {
      'years': years,
      'months': months,
      'days': days,
      'totalDays': totalDays,
    };
  }

  @override
  List<String> getUnitsForType(ConverterType type) {
    switch (type) {
      case ConverterType.volume:
        return _volumeRates.keys.toList();
      case ConverterType.time:
        return _timeRates.keys.toList();
      case ConverterType.data:
        return _dataRates.keys.toList();
      case ConverterType.temperature:
        return ['Celsius', 'Fahrenheit', 'Kelvin'];
      case ConverterType.discount:
        return ['Original Price', 'Discounted Price'];
      case ConverterType.age:
        return ['Birth Date', 'Current Age'];
    }
  }
}
