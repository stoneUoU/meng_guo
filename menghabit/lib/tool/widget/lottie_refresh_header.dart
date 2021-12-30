import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/constants/colors.dart';
import 'package:lottie/lottie.dart';

/// 弹出圆圈Header
class RefreshHeaderWidget extends Header {
  /// Keyx
  final Key? key;

  /// 颜色
  final Color color;

  /// 背景颜色
  final Color backgroundColor;

  final LinkHeaderNotifier linkNotifier = LinkHeaderNotifier();

  RefreshHeaderWidget({
    this.key,
    this.color = Colors.white,
    this.backgroundColor = colorEEEEEE,
    bool enableHapticFeedback = false,
  }) : super(
          extent: 80.0,
          triggerDistance: 80.0,
          float: false,
          enableHapticFeedback: enableHapticFeedback,
          enableInfiniteRefresh: false,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      RefreshMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration? completeDuration,
      bool enableInfiniteRefresh,
      bool success,
      bool noMore) {
    // 不能为水平方向以及反向
    assert(axisDirection == AxisDirection.down,
        'Widget can only be vertical and cannot be reversed');
    linkNotifier.contentBuilder(
        context,
        refreshState,
        pulledExtent,
        refreshTriggerPullDistance,
        refreshIndicatorExtent,
        axisDirection,
        float,
        completeDuration,
        enableInfiniteRefresh,
        success,
        noMore);
    return VVHeaderWidget(
      key: key,
      color: color,
      backgroundColor: backgroundColor,
      linkNotifier: linkNotifier,
    );
  }
}

/// 弹出小球组件
class VVHeaderWidget extends StatefulWidget {
  /// 颜色
  final Color color;

  /// 背景颜色
  final Color backgroundColor;

  final LinkHeaderNotifier linkNotifier;

  const VVHeaderWidget({
    Key? key,
    required this.color,
    required this.backgroundColor,
    required this.linkNotifier,
  }) : super(key: key);

  @override
  _VVHeaderWidgetState createState() {
    return _VVHeaderWidgetState();
  }
}

class _VVHeaderWidgetState extends State<VVHeaderWidget>
    with TickerProviderStateMixin<VVHeaderWidget> {
  RefreshMode get _refreshState => widget.linkNotifier.refreshState;

  double get _pulledExtent => widget.linkNotifier.pulledExtent;

  double get _indicatorExtent => widget.linkNotifier.refreshIndicatorExtent;

  /// 记录开始执行动画时，波浪的位置
  double _waveTopBeforeAnimator = 0.0;

  /// 上一次的移动距离
  double _lastPulledExtent = 0.0;

  /// 波浪顶部
  double _waveTop = 0.0;

  /// 波浪高度（负数表示向上的波浪）
  double _waveHeight = 0.0;

  late AnimationController _bezierController;
  late CurvedAnimation _bezierAnimation;
  late AnimationController _lottieController;

  /// 鸟进场动画
  final String _lottieEnter = 'assets/json/refresh_header_pull.json';

  /// 鸟刷新动画
  final String _lottieRefresh = 'assets/json/refresh_header_refresh.json';

  /// 鸟退出动画
  final String _lottieExit = 'assets/json/refresh_header_refresh_end.json';

  late Future<LottieComposition> _compositionEnter;
  late Future<LottieComposition> _compositionRefresh;
  late Future<LottieComposition> _compositionExit;

  /// 当前播放的lottie动画
  Future<LottieComposition>? _composition;

  /// 是否正在播放贝塞尔曲线动画
  bool _isBezierAnimationRunning = false;

  /// 是否正在播放小鸟的动画
  bool _isLottieAnimationRunning = false;

  @override
  void initState() {
    super.initState();
    _compositionEnter = _loadComposition(_lottieEnter);
    _compositionRefresh = _loadComposition(_lottieRefresh);
    _compositionExit = _loadComposition(_lottieExit);
    _initBezierControl();
    _initLottieAnimator();
    _bezierAnimation.addListener(() {
      if (_indicatorExtent - _bezierAnimation.value >= 0.25 &&
          !_isLottieAnimationRunning) {
        _isLottieAnimationRunning = true;
        _composition = _compositionEnter;
        _lottieController.reset();
        _lottieController.forward();
      }
    });
  }

  /// 计算曲线参数
  void _calculationBezier() {
    if (_refreshState == RefreshMode.drag) {
      _waveTop = math.min(_pulledExtent * 0.5, _indicatorExtent);
    } else if (_bezierController.isAnimating) {
      double percent = _bezierAnimation.value;
      if (percent <= 0.25) {
        _waveTop = _waveTopBeforeAnimator -
            (_waveTopBeforeAnimator - _indicatorExtent) * percent * 4;
      } else {
        _waveTop = _indicatorExtent;
      }
    } else {
      _waveTop = _indicatorExtent;
    }
    _waveHeight = _bezierController.isAnimating
        ? _getAnimatorWaveHeight()
        : math.max(
            0, (_waveHeight + (_pulledExtent - _lastPulledExtent) * 0.5));
    _lastPulledExtent = _pulledExtent;
  }

  /// 波浪回弹高度计算
  double _getAnimatorWaveHeight() {
    double percent = _bezierAnimation.value;
    if (percent <= 0.25) {
      return 10 - 60 * percent * 4;
    } else if (percent <= 0.5) {
      return -50 + 50 * (percent - 0.25) * 4;
    } else if (percent <= 0.75) {
      return -10 * (percent - 0.5) * 4;
    } else {
      return -10 + 10 * (percent - 0.75) * 4;
    }
  }

  Future<LottieComposition> _loadComposition(String lottie) async {
    var assetData = await rootBundle.load('packages/habit/$lottie');
    return await LottieComposition.fromByteData(assetData);
  }

  /// 初始化lottie动画
  void _initLottieAnimator() {
    _lottieController = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _lottieController.addStatusListener((status) {
      /// 小鸟的进入的动画播放完毕后，切换为刷新动画
      if (_composition == _compositionEnter &&
          status == AnimationStatus.completed) {
        _composition = _compositionRefresh;
      } else if (_composition == _compositionExit &&
          status == AnimationStatus.completed) {
        _composition = null;
        _lottieController.reset();
      }
    });
  }

  /// 初始化贝塞尔曲线动画
  void _initBezierControl() {
    /// 回弹动画
    _bezierController = new AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _bezierAnimation =
        new CurvedAnimation(parent: _bezierController, curve: Curves.ease);
  }

  @override
  void dispose() {
    _bezierController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 启动回弹动画
    if (_refreshState == RefreshMode.armed) {
      if ((_waveTop < _indicatorExtent ||
              _pulledExtent - _indicatorExtent < 10) &&
          !_isBezierAnimationRunning) {
        _waveTopBeforeAnimator = _waveTop;
        _isBezierAnimationRunning = true;
        _bezierController.reset();
        _bezierController.forward();
      }
    } else if (_refreshState == RefreshMode.done) {
      if (_composition != null) {
        _composition = _compositionExit;
        _lottieController.reset();
        _lottieController.forward();
      }
    } else if (_refreshState == RefreshMode.inactive) {
      if (_composition != null) {
        _composition = null;
        _lottieController.reset();
      }
      _isBezierAnimationRunning = false;
      _isLottieAnimationRunning = false;
    }
    _calculationBezier();
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _bezierAnimation,
          builder: (context, child) {
            return ClipPath(
              clipper: _BezierPainter(
                waveTop: _waveTop,
                waveHeight: _waveHeight,
                isDownBezier: _waveHeight < 0,
              ),
              child: Container(
                color: widget.backgroundColor,
                width: double.infinity,
                height: double.infinity,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _lottieController,
          builder: (context, child) {
            return _composition == null
                ? Center()
                : Container(
                    alignment: Alignment.topCenter,
                    height: _indicatorExtent,
                    child: FutureBuilder<LottieComposition>(
                      future: _composition,
                      builder: (context, snapshot) {
                        var composition = snapshot.data;
                        if (composition == null) {
                          return Center();
                        }
                        _lottieController.duration = composition.duration;
                        return Lottie(composition: composition);
                      },
                    ),
                  );
          },
        ),
      ],
    );
  }
}

/// 贝塞尔曲线
///
class _BezierPainter extends CustomClipper<Path> {
  /// 波浪顶部
  final double waveTop;

  /// 波浪高度
  final double waveHeight;

  /// 是否是向下的波浪
  final bool isDownBezier;
  final path = new Path();

  _BezierPainter({
    required this.waveTop,
    required this.waveHeight,
    required this.isDownBezier,
  });

  @override
  Path getClip(Size size) {
    double width = size.width;
    if (isDownBezier) {
      path.reset();
      path.lineTo(0, waveTop);
      path.quadraticBezierTo(width / 8 * 3, waveTop, width / 16 * 7,
          waveTop + waveHeight - waveHeight / 2);
      path.quadraticBezierTo(width / 2, waveTop + waveHeight, width / 16 * 9,
          waveTop + waveHeight - waveHeight / 2);
      path.quadraticBezierTo(width / 8 * 5, waveTop, width, waveTop);
      path.lineTo(width, 0);
    } else {
      path.reset();
      path.lineTo(0, waveTop);
      path.quadraticBezierTo(width / 4, waveTop, width / 8 * 3,
          waveTop + waveHeight - waveHeight / 2);
      path.quadraticBezierTo(width / 2, waveTop + waveHeight, width / 8 * 5,
          waveTop + waveHeight - waveHeight / 2);
      path.quadraticBezierTo(width / 4 * 3, waveTop, width, waveTop);
      path.lineTo(width, 0);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
