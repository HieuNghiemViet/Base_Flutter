extension DoubleExtensions on double {
  double roundToFixed(int? fixed) {
    return double.parse(
      num.parse(
        toString(),
      ).toStringAsFixed(fixed ?? 2),
    );
  }
}
