import 'package:menghabit/menghabit.dart';

class RepeatValueNotifier<T> extends ValueNotifier<T> {
  RepeatValueNotifier(T value) : super(value);

  ///
  /// 1.0更改值，强制刷新
  ///
  /// @deprecated  这个方法讲在 flutter 2.0之后被废弃，
  /// 为了API的统一性，采用和系统所提供的 ValueNotifier 一样的调用方式
  ///
  ///
  @Deprecated("expires flutter 2.0")
  void notifyChange(T t) {
    if (t != null && value != t) {
      value = t;
    } else {
      notifyListeners();
    }
  }

  @override
  set value(T newValue) {
    if (newValue != null && value != newValue) {
      super.value = newValue;
    } else {
      notifyListeners();
    }
  }
}
