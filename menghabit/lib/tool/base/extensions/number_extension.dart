extension NullableNumberExtension on num? {
  /// 判断number空或0
  bool isNullOrZero() {
    return this == null || this == 0;
  }

  /// 判断number非空或0
  bool isNotNullOrZero() {
    return this != null || this != 0;
  }

  /// 判断number非空且大于0
  bool isNotNullOrGreaterZero() {
    return this != null && this! > 0;
  }
}

extension NumberExtension on num {}
