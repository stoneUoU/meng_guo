import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/repeat_value_notifier.dart';
import 'package:menghabit/tool/constants/colors.dart';

typedef _InputCallBack = void Function(String value);

TextStyle _commonTextStyle = TextStyle(
  color: color_FF333333,
  fontSize: 16.px,
);
TextStyle _commonPlaceHolderStyle = TextStyle(
  color: color_CCCCCC,
  fontSize: 14.px,
);

class CommonTextField extends StatefulWidget {
  final String text;

  /// 占位文本
  final String placeholder;

  /// 占位文本style
  final TextStyle placeholderStyle;

  final String? helperText;

  final TextStyle? helperStyle;

  // /// 悬浮文本 （用于替换占位文本）
  final String? suspendText;
  //
  // /// 悬浮文本style
  final TextStyle suspendTextStyle;

  /// 校验正则
  final FormFieldValidator<String>? validation;

  /// 是否错误
  final bool isError;

  ///键盘类型，默认文字
  final TextInputType keyboardType;

  final FocusNode? focusNode;

  ///右侧widget ，默认为清除按钮
  final Widget? suffixWidget;

  ///最大行数，默认显示一行，自动换行，最多展示_maxLines 行
  final int? maxLines;

  final bool autoFocus;

  ///最大长度，默认_maxLength
  final int maxLength;

  ///是否显示右侧最大长度文字，默认不显示
  final bool showMaxLength;

  ///是否可编辑，默认true
  final bool enabled;

  /// 内边距
  final EdgeInsetsGeometry? contentPadding;

  /// 输入回调
  final _InputCallBack inputCallBack;
  final TextStyle textStyle;

  final TextEditingController? editingController;

  ///下划线，默认无
  // final bool enableUnderLine;

  /// 下划线颜色
  // final Color? underLineColor;

  /// 光标颜色
  // final Color cursorColor;

  /// 光标高度
  // final double cursorHeight;

  /// 是否开启输入框长按复制、粘贴等功能
  final bool enableInteractiveSelection;

  /// 初始化时的内容
  final String? initialValue;

  final bool obscureText;

  final bool isDense;

  final List<TextInputFormatter>? inputFormatters;

  /// 自动填充类型
  final Iterable<String>? autofillHints;

  final bool showClearButton;

  CommonTextField({
    Key? key,
    this.text = '',
    this.keyboardType = TextInputType.text,
    this.placeholder = '',
    this.focusNode,
    this.suffixWidget,
    this.maxLines = 1,
    this.maxLength: 100,
    this.showMaxLength = false,
    this.enabled = true,
    this.obscureText = false,
    required this.inputCallBack,
    TextStyle? testStyle,
    TextStyle? placeholderStyle,
    TextStyle? suspendTextStyle,
    TextStyle? errorTextStyle,
    this.enableInteractiveSelection = false,
    this.contentPadding,
    this.validation,
    this.initialValue,
    this.isError = false,
    this.helperText,
    this.helperStyle,
    this.inputFormatters,
    this.autofillHints,
    this.showClearButton = false,
    this.editingController,
    this.suspendText,
    this.isDense = true,
    this.autoFocus = false,
  })  : textStyle = testStyle ?? _commonTextStyle,
        placeholderStyle = placeholderStyle ?? _commonPlaceHolderStyle,
        suspendTextStyle = placeholderStyle ?? _commonPlaceHolderStyle,
        // this.suspendTextStyle = suspendTextStyle ?? _commonPlaceHolderStyle,
        // this.errorTextStyle = errorTextStyle ?? _commonErrorStyle,
        super(key: key);

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late TextEditingController _textController;
  late FocusNode _focusNode;
  RepeatValueNotifier<bool> _focusStatus = RepeatValueNotifier(false);

  /// 是否校验错误
  ValueNotifier<bool> _isError = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _textController = widget.editingController ?? TextEditingController();
    _textController.text = widget.text;
    _focusNode = widget.focusNode != null ? widget.focusNode! : FocusNode();
    _focusNode.addListener(() {
      _focusStatus.value = _focusNode.hasFocus;
    });
    if (widget.initialValue != null) {
      _textController.text = widget.initialValue!;
    }
    _textController.addListener(() {
      if (_textController.text.length == 0) {
        widget.inputCallBack('');
      }
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      builder: (BuildContext context, value, Widget? child) {
        _isError.value = widget.isError;
        return TextFormField(
          enabled: widget.enabled,
          focusNode: _focusNode,
          controller: _textController,
          keyboardType: widget.keyboardType,
          style: widget.textStyle,
          textAlignVertical: TextAlignVertical.center,
          keyboardAppearance: Brightness.light,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines,
          cursorColor: const Color(0xFF3699FF),
          autofocus: widget.autoFocus,
          autofillHints: widget.autofillHints,
          validator: widget.validation,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            helperText: widget.helperText,
            helperStyle: widget.helperStyle,
            hintText: widget.placeholder,
            hintStyle: widget.placeholderStyle,
            labelText: widget.suspendText,
            labelStyle: widget.suspendTextStyle,
            isDense: widget.isDense,
            suffixIconConstraints: widget.suffixWidget != null
                ? BoxConstraints(
                    maxHeight: 30.px,
                    maxWidth: 130.px,
                  )
                : widget.showClearButton
                    ? BoxConstraints(
                        maxHeight: 30.px,
                        maxWidth: 30.px,
                      )
                    : null,
            suffixIcon: widget.showClearButton
                ? _buildClearSuffix()
                : widget.suffixWidget,
            border: InputBorder.none,
            contentPadding:
                widget.contentPadding ?? EdgeInsets.fromLTRB(0, 8, 5, 8),
            enabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (value) {
            widget.inputCallBack(_textController.text);
          },
        );
      },
      valueListenable: _focusStatus,
    );
  }

  Widget _buildClearSuffix() {
    return ValueListenableBuilder<TextEditingValue>(
        valueListenable: _textController,
        builder: (BuildContext context, value, Widget? child) {
          return Visibility(
            visible: value.text.length > 0 && _focusStatus.value == true,
            child: GestureDetector(
              onTap: () {
                _textController.clear();
              },
              child: Container(
                // padding: EdgeInsets.only(right: 8.px),
                child: Image.asset(
                  "assets/images/login/common_del_black.png",
                  // fit: BoxFit.contain,
                  width: 24.px,
                  height: 24.px,
                ),
              ),
            ),
          );
        });
  }
}

/// 自定义兼容中文拼音输入法正则校验输入框
class CustomizedTextInputFormatter extends TextInputFormatter {
  final Pattern? filterPattern;

  CustomizedTextInputFormatter({this.filterPattern})
      : assert(filterPattern != null);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.isComposingRangeValid) return newValue;
    if (filterPattern != null) {
      return FilteringTextInputFormatter.allow(filterPattern!)
          .formatEditUpdate(oldValue, newValue);
    } else {
      return newValue;
    }
  }
}

/// 自定义兼容中文拼音输入法长度限制输入框
class CustomizedLengthTextInputFormatter extends TextInputFormatter {
  final int maxLength;

  CustomizedLengthTextInputFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.isComposingRangeValid) return newValue;
    return LengthLimitingTextInputFormatter(maxLength)
        .formatEditUpdate(oldValue, newValue);
  }
}
