extension NullableObjectExtension on Object? {
  /// 不为空类型强转或返回新对象
  T asTypeOrNew<T>(T t) => this != null ? this as T : t;

  /// 不为空检查类型并强转或返回新对象
  T asSafeTypeOrNew<T>(T t) => this != null && this is T ? this as T : t;
}

extension ObjectExtension on Object {
  /// 类型强转
  T asType<T>() => this as T;

  /// 检查类型并强转或返回空
  T? asSafeType<T>() => this is T ? this as T : null;
}

extension NullableTypeExtension<T> on T? {
  /// 不为空返回自身否则返回新对象
  T orNew(T t) => this ?? t;
}

extension TypeExtension<T> on T {
  T also(void Function(T value) delegate) {
    delegate(this);
    return this;
  }

  R let<R>(R Function(T value) delegate) {
    return delegate(this);
  }
}
