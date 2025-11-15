import 'package:get/get.dart';
import '../../data/repositories/converter_repository_impl.dart';
import '../../domain/entities/converter.dart';
import '../../domain/usecases/convert_unit.dart';

class ConverterController extends GetxController {
  final ConvertUnit _convertUnit = ConvertUnit(ConverterRepositoryImpl());

  // Observable variables
  final Rx<ConverterType> selectedType = ConverterType.volume.obs;
  final RxString fromUnit = ''.obs;
  final RxString toUnit = ''.obs;
  final RxString inputValue = ''.obs;
  final RxString result = '0'.obs;
  final RxList<String> availableUnits = <String>[].obs;
  final RxBool hasError = false.obs;

  // For age calculator
  final Rx<DateTime?> selectedBirthDate = Rx<DateTime?>(null);
  final RxMap<String, int> ageResult = <String, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _updateUnitsForType();
  }

  void changeConverterType(ConverterType type) {
    selectedType.value = type;
    _updateUnitsForType();
    inputValue.value = '';
    result.value = '0';
    hasError.value = false;
    selectedBirthDate.value = null;
    ageResult.clear();
  }

  void _updateUnitsForType() {
    availableUnits.value = _convertUnit.getUnitsForType(selectedType.value);

    if (availableUnits.isNotEmpty) {
      fromUnit.value = availableUnits[0];
      toUnit.value = availableUnits.length > 1
          ? availableUnits[1]
          : availableUnits[0];
    }
  }

  void setFromUnit(String unit) {
    fromUnit.value = unit;
    if (inputValue.value.isNotEmpty) {
      convert();
    }
  }

  void setToUnit(String unit) {
    toUnit.value = unit;
    if (inputValue.value.isNotEmpty) {
      convert();
    }
  }

  void setInputValue(String value) {
    inputValue.value = value;
    if (value.isNotEmpty) {
      convert();
    } else {
      result.value = '0';
    }
  }

  void convert() {
    if (inputValue.value.isEmpty) {
      result.value = '0';
      return;
    }

    try {
      hasError.value = false;
      double value = double.parse(inputValue.value);

      if (selectedType.value == ConverterType.discount) {
        // For discount, input is original price, toUnit is discount percentage
        double discountPercent = double.tryParse(toUnit.value) ?? 0;
        double discountedPrice = _convertUnit
            .execute(
              type: ConverterType.discount,
              value: value,
              fromUnit: 'Original Price',
              toUnit: discountPercent.toString(),
            )
            .result;

        result.value = discountedPrice.toStringAsFixed(2);
      } else {
        Converter conversion = _convertUnit.execute(
          type: selectedType.value,
          value: value,
          fromUnit: fromUnit.value,
          toUnit: toUnit.value,
        );

        // Format result
        if (conversion.result == conversion.result.toInt()) {
          result.value = conversion.result.toInt().toString();
        } else {
          result.value = conversion.result
              .toStringAsFixed(6)
              .replaceAll(RegExp(r'0*$'), '')
              .replaceAll(RegExp(r'\.$'), '');
        }
      }
    } catch (e) {
      result.value = 'Error';
      hasError.value = true;
    }
  }

  void calculateAge(DateTime birthDate) {
    try {
      hasError.value = false;
      selectedBirthDate.value = birthDate;
      ageResult.value = _convertUnit.calculateAge(birthDate);
    } catch (e) {
      hasError.value = true;
      ageResult.clear();
    }
  }

  void swapUnits() {
    if (selectedType.value == ConverterType.age ||
        selectedType.value == ConverterType.discount) {
      return; // Cannot swap for age and discount
    }

    String temp = fromUnit.value;
    fromUnit.value = toUnit.value;
    toUnit.value = temp;

    if (inputValue.value.isNotEmpty) {
      convert();
    }
  }

  String getConverterTypeName(ConverterType type) {
    switch (type) {
      case ConverterType.volume:
        return 'Volume';
      case ConverterType.time:
        return 'Time';
      case ConverterType.discount:
        return 'Discount';
      case ConverterType.data:
        return 'Data';
      case ConverterType.temperature:
        return 'Temperature';
      case ConverterType.age:
        return 'Age';
    }
  }
}
