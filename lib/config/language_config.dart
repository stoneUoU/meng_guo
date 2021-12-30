import 'package:menghabit/tool/constants/http_constants.dart';

/// 默认覆盖之前的URL
void setLanguageUp(String? language) {
  String value = language == null || language.isEmpty
      ? LanguageConfig.DEFAULT_LANGUAGE
      : language;
  currentLanguage = value;
  LanguageConfig.currentLanguage = value;
}

/// 获取当前的语言
class LanguageConfig {
  static const DEFAULT_LANGUAGE = "zh";
  static String currentLanguage = DEFAULT_LANGUAGE;

  /// 获取当前的语言
  static String getCurrentLanguage() {
    return currentLanguage;
  }

  /// 当前是否是中文
  static bool isZh() {
    return currentLanguage == DEFAULT_LANGUAGE;
  }
}
