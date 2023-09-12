import 'package:universal_platform/universal_platform.dart';

class BuildConfig {
  //系统标记类
  static bool isDebug = !bool.fromEnvironment("dart.vm.product");
  static bool isAndroid = UniversalPlatform.isAndroid;
  static bool isIos = UniversalPlatform.isIOS;
  static String SECURITY_KEY_BOTAO_ANDROID =
      "vadjlr4k3o;qj4io23ug9034uji5rjn34io5u83490u5903huq";
}
