import 'package:flutter/services.dart';

class MaxValueInputFormatter extends TextInputFormatter {
  final double maxValue;

  MaxValueInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    try {
      final double value = double.parse(newValue.text);
      if (value <= maxValue) {
        return newValue;
      }
    } catch (e) {
      return oldValue;
    }

    return oldValue;
  }
}
