import 'package:flutter/material.dart';
import 'package:meng_guo/router/router_observer.dart';
import 'package:provider/single_child_widget.dart';

typedef SingleWidgetBuilder = Widget Function(
    BuildContext context, Widget? child);

/// 构建路由监听
class RouterLifeCycleWidget<T> extends SingleChildStatefulWidget {
  final SingleWidgetBuilder builder;
  final VoidCallback? onStop;
  final VoidCallback? onResume;
  final VoidCallback? onStart;
  final VoidCallback? onPause;

  RouterLifeCycleWidget(
      {Key? key,
      required this.builder,
      Widget? child,
      this.onStop,
      this.onPause,
      this.onStart,
      this.onResume})
      : super(child: child);

  @override
  _RouterLifeCycleWidgetState<T> createState() {
    return _RouterLifeCycleWidgetState();
  }
}

class _RouterLifeCycleWidgetState<T>
    extends SingleChildState<RouterLifeCycleWidget<T>> with RouteAware {
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return widget.builder.call(context, child);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ModalRoute? modalRoute = ModalRoute.of(context);
    if (modalRoute != null) {
      routeObserver.subscribe(this, modalRoute);
    }
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  /// 刚被关闭的时候
  @override
  void didPop() {
    super.didPop();
    widget.onStop?.call();
  }

  /// 刚进去页面的时候
  @override
  void didPush() {
    super.didPush();
    widget.onStart?.call();
  }

  /// 新的路由展示，当前页面不展示
  @override
  void didPushNext() {
    super.didPushNext();
    widget.onPause?.call();
  }

  /// 新的页面被关闭，当前页面展示
  @override
  void didPopNext() {
    super.didPopNext();
    widget.onResume?.call();
  }
}
