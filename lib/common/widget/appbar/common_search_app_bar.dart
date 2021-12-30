import 'package:meng_guo/colors/colors.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';

class CommonSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// 输入框占位文本
  final String placeholder;

  /// 是否有返回箭头
  // final bool hasBackButton;

  /// 状态栏颜色
  final Brightness brightness;

  ///输入改变回调
  final ValueChanged<String>? changedHandler;

  ///输入完成时，配合TextInputAction.done使用（比submit先调用）
  final VoidCallback? editingCompleteHandler;

  ///提交时,配合TextInputAction
  final ValueChanged? submittedHandler;

  ///清除按钮回调
  final VoidCallback? clearHandler;

  /// textField点击时
  final VoidCallback? onTapHandler;

  /// 是否开启输入框长按复制、粘贴等功能
  final bool enableInteractiveSelection;

  /// 自动弹出键盘
  final bool autoFocus;

  const CommonSearchAppBar({
    Key? key,
    required this.placeholder,
    // required this.hasBackButton,
    this.brightness = Brightness.light,
    this.enableInteractiveSelection = false,
    this.changedHandler,
    this.editingCompleteHandler,
    this.submittedHandler,
    this.clearHandler,
    this.onTapHandler,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CommonSearchAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CommonSearchAppBarState extends State<CommonSearchAppBar>
    with WidgetsBindingObserver {
  // 输入框的焦点实例
  late FocusNode _focusNode;
  // 当前键盘是否是激活状态
  bool isKeyboardActive = false;

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    // 监听输入框焦点变化
    // _focusNode.addListener(_onFocus);
    // 创建一个界面变化的观察者
    WidgetsBinding.instance?.addObserver(this);

    if (widget.autoFocus) {
      Future.delayed(Duration(milliseconds: 700), () {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final value = WidgetsBinding.instance?.window.viewInsets.bottom ?? 0;
    if (oldValue != 0 && isReduceAction(value) && value == 0) {
      _focusNode.unfocus();
    }
    oldValue = value;
  }

  double oldValue = 0;

  /// 判断递减序列
  bool isReduceAction(double value) {
    return value - oldValue < 0;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      elevation: 0,
      brightness: widget.brightness,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(
                  left: 16.px, right: 64.px, bottom: 5.px, top: 5.px),
              height: 44.px,
              decoration: BoxDecoration(
                color: color_F2F2F2,
                borderRadius: BorderRadius.circular(22.px),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.px, right: 4.px),
                    child: Image(
                      width: 24.px,
                      height: 24.px,
                      image: AssetImage(
                        'assets/images/publish/search_bar_icon.png',
                      ),
                      color: color_FF999999,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: widget.changedHandler,
                      onEditingComplete: widget.editingCompleteHandler,
                      onSubmitted: widget.submittedHandler,
                      onTap: widget.onTapHandler,
                      focusNode: _focusNode,

                      ///iOS默认的TextField弹出的键盘是暗模式，需要修改为普通模式
                      keyboardAppearance: Brightness.light,
                      enableInteractiveSelection:
                          widget.enableInteractiveSelection,
                      cursorColor: color_FF030319,
                      // cursorHeight: 15.px,
                      // cursorWidth: 1.5.px,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.zero,
                        alignLabelWithHint: true,
                        isDense: true,
                        // contentPadding: EdgeInsets.symmetric(vertical: 0.px),
                        border: InputBorder.none,
                        hintText: widget.placeholder,
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 30.px,
                          maxWidth: 30.px,
                        ),
                        suffixIcon: ValueListenableBuilder<TextEditingValue>(
                            valueListenable: _controller,
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return Visibility(
                                visible: value.text.length > 0,
                                child: GestureDetector(
                                  onTap: () {
                                    if (widget.clearHandler != null) {
                                      widget.clearHandler?.call();
                                    }
                                    _controller.clear();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(right: 8.px),
                                    child: Image.asset(
                                      "assets/images/login/common_del_black.png",
                                      // fit: BoxFit.contain,
                                      width: 30.px,
                                      height: 30.px,
                                    ),
                                  ),
                                ),
                              );
                            }),
                        hintStyle: TextStyle(
                          fontSize: 16.px,
                          color: color_FFBDBDBD,
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 16.px, color: color_FF333333, height: 1.2),
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                ],
              )),
          Positioned(
            right: 16.px,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Text(
                '取消',
                style: TextStyle(
                  fontSize: 16.px,
                  color: color_FF000000,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }
}
