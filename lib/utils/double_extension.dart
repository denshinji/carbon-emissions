// create double extension to check if double negatif return zero

extension DoubleExtension on double {
  double get notNegative => this < 0
      ? 0
      : this > 3000000
          ? 3000000
          : this;
}
