extension NullableListExtension<E> on List<E>? {
  /// 返回自身或空列表
  List<E> orEmptyList({bool growable = false}) =>
      this ?? List<E>.empty(growable: growable);
}

extension ListExtension<E> on List<E> {
  /// 删除空数据
  List<E> removeNull() => this.where((element) => element != null).toList();
}
