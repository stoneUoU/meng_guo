import 'package:flutter/material.dart';
import 'package:menghabit/tool/base/repeat_value_notifier.dart';
import 'package:menghabit/tool/constants/colors.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';
import 'package:menghabit/menghabit.dart';

/// Desc:
///   用于封装显示对话框的属性，扩展在[BaseViewModel]
class AppDialogExtraProperty {
  /// 弹窗相关属性
  RepeatValueNotifier<DialogProperty?> dialogProperty =
      RepeatValueNotifier(null);

  ///
  /// 展示对话框
  ///  Param [value] 需要展示的数据
  ///
  void showInfoDialog(DialogProperty value) {
    dialogProperty.value = value;
  }
}

/// Desc:
/// <p> 封装对话框的相关属性
class DialogProperty {
  ///
  ///  对话框边缘属性配置
  ///
  DialogInfoExtra _dialogExtra = DialogInfoExtra();

  ///
  /// 对话框标题字体属性
  ///
  FontProperty _titleFontProperty = FontProperty(
    "",
    fontWeight: FontWeight.bold,
    fontSize: 18.px,
    color: Colors.black,
    maxLine: 1,
    align: TextAlign.center,
    height: 1,
  );

  ///
  /// 对话框内容字体属性
  ///
  FontProperty _contentFontProperty = FontProperty(
    "",
    fontWeight: FontWeight.normal,
    fontSize: 16.px,
    color: color333333,
    maxLine: 1,
    align: TextAlign.center,
    height: 1.2,
  );

  ///
  /// 对话框消极字体属性
  ///
  FontProperty _negativeFontProperty = FontProperty(
    "",
    fontWeight: FontWeight.normal,
    fontSize: 14.px,
    color: color333333,
    maxLine: 1,
    align: TextAlign.center,
    height: 1,
  );

  ///
  /// 对话框积极字体属性
  ///
  FontProperty _positiveFontProperty = FontProperty(
    "",
    fontWeight: FontWeight.normal,
    fontSize: 14.px,
    color: color_FFA22D,
    maxLine: 1,
    align: TextAlign.center,
    height: 1,
  );

  ///
  /// Param [title] 设置对话框标题
  /// Param [content] 设置对话框描述
  /// Param [negativeText] 设置对话框取消按钮的文字描述
  /// Param [positiveText] 设置对话框确定按钮的文字描述
  /// Param [negativeFun] 消极按钮点击事件
  /// Param [positiveFun] 积极按钮点击事件
  /// Param [barrierDismissible] 是否可以点击阴影部分取消
  ///
  DialogProperty(
      String title, String content, String negativeText, String positiveText,
      {Function? negativeFun,
      Function? positiveFun,
      bool barrierDismissible = true}) {
    _titleFontProperty.content = title;
    _contentFontProperty.content = content;
    _negativeFontProperty.content = negativeText;
    _positiveFontProperty.content = positiveText;
    _dialogExtra.barrierDismissible = barrierDismissible;
    _dialogExtra.negativeFun = negativeFun ?? () => {};
    _dialogExtra.positiveFun = positiveFun ?? () => {};
  }

  List<FontProperty>? dialogGroupBtn;

  ///
  /// 设置按钮相关属性
  ///
  /// Param [titleFontProperty]     标题相关属性
  /// Param [contentFontProperty]   内容相关属性
  /// Param [negativeFontProperty]  消极按钮相关属性
  /// Param [positiveFontProperty]  积极按钮相关属性
  /// Param [DialogInfoExtra]       对话框相关属性
  ///
  DialogProperty.customer(
    FontProperty titleFontProperty,
    FontProperty contentFontProperty,
    FontProperty negativeFontProperty,
    FontProperty positiveFontProperty,
    DialogInfoExtra dialogPropertyExtra, {
    this.dialogGroupBtn,
  }) {
    _copyWithFontProperty(_titleFontProperty, titleFontProperty);
    _copyWithFontProperty(_contentFontProperty, contentFontProperty);
    _copyWithFontProperty(_negativeFontProperty, negativeFontProperty);
    _copyWithFontProperty(_positiveFontProperty, positiveFontProperty);
    _copyWithDialogProperty(_dialogExtra, dialogPropertyExtra);
  }

  ///
  /// Param [contentFontProperty]  对话框内容相关属性
  /// Param [dialogPropertyExtra]  对话框相关属性
  /// Param [dialogGroupBtn]       对话框可选按钮
  ///
  DialogProperty.multiNoTitle(FontProperty contentFontProperty,
      DialogInfoExtra dialogPropertyExtra, this.dialogGroupBtn) {
    _copyWithFontProperty(_contentFontProperty, contentFontProperty);
    _copyWithDialogProperty(_dialogExtra, dialogPropertyExtra);
  }

  ///
  /// Param [contentFontProperty]  对话框内容相关属性
  /// Param [dialogPropertyExtra]  对话框相关属性
  /// Param [dialogGroupBtn]       对话框可选按钮
  ///
  DialogProperty.multi(
      FontProperty titleFontProperty,
      FontProperty contentFontProperty,
      DialogInfoExtra dialogPropertyExtra,
      this.dialogGroupBtn) {
    _copyWithFontProperty(_titleFontProperty, titleFontProperty);
    _copyWithFontProperty(_contentFontProperty, contentFontProperty);
    _copyWithDialogProperty(_dialogExtra, dialogPropertyExtra);
  }

  ///
  /// 设置拷贝对话框对象相关属性
  /// Param [target] 设置需要拷贝后的对象
  /// Param [origin] 设置需要拷贝的对象
  ///
  void _copyWithDialogProperty(
    DialogInfoExtra target,
    DialogInfoExtra origin,
  ) {
    target.borderRadius = origin.borderRadius ?? target.borderRadius;
    target.bgColor = origin.bgColor ?? target.bgColor;
    target.marginLeftAndRight = origin.marginLeftAndRight;
    target.barrierDismissible = origin.barrierDismissible;
    target.contentMinHeight = origin.contentMinHeight;
    target.contentEdge = origin.contentEdge;
    target.titleEdge = origin.titleEdge;
    target.dialogButtonGroup = origin.dialogButtonGroup;
    target.indexCallBack = origin.indexCallBack ?? (index) => {};
    target.negativeFun = origin.negativeFun ?? () => {};
    target.positiveFun = origin.positiveFun ?? () => {};
  }

  ///
  /// 设置拷贝字体对象相关属性
  /// Param [target] 设置需要拷贝后的对象
  /// Param [origin] 设置需要拷贝的对象
  ///
  FontProperty _copyWithFontProperty(FontProperty target, FontProperty origin) {
    target.content = origin.content;
    target.fontSize = origin.fontSize ?? target.fontSize;
    target.fontWeight = origin.fontWeight ?? target.fontWeight;
    target.maxLine = origin.maxLine ?? target.maxLine;
    target.color = origin.color ?? target.color;
    target.align = origin.align ?? target.align;
    target.height = origin.height ?? target.height;
    return target;
  }

  FontProperty get contentFontProperty => _contentFontProperty;

  FontProperty get negativeFontProperty => _negativeFontProperty;

  FontProperty get positiveFontProperty => _positiveFontProperty;

  FontProperty get titleFontProperty => _titleFontProperty;

  DialogInfoExtra get dialogExtra => _dialogExtra;
}

/// Desc:
/// <p> 文字的描述属性
class FontProperty {
  double? fontSize;
  FontWeight? fontWeight;
  int? maxLine;
  Color? color;
  String content;
  TextAlign? align;
  double? height;
  Color? btnBg;
  double? radius;

  ///
  /// Param [fontSize]     设置文字大小
  /// Param [fontWeight]   设置文字字重
  /// Param [maxLine]      设置文字最大行数
  /// Param [color]       设置文字背景颜色
  /// Param [align]       设置文字的对齐方式
  /// Param [height]      设置文字的行高
  ///
  FontProperty(
    this.content, {
    this.maxLine = 1,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.align,
    this.height,
    this.btnBg = color_FF4CD080,
    this.radius = 8,
  });
}

/// Desc:
/// <p> 对话框相关配置信息
const EdgeInsets _kcEdgeInsets =
    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24);
const EdgeInsets _ktEdgeInsets = EdgeInsets.only(left: 0, right: 0, top: 16);

/// Desc:
/// <p>  对话框按钮样式
enum DialogButtonGroup {
  /// 单一选择
  DialogButtonSingle,

  /// 正常样式，两个按钮
  DialogButtonNormal,

  /// 按钮组
  DialogButtonMulti,
}

typedef IndexCallBack = void Function(int index);

class DialogInfoExtra {
  Color? bgColor;
  double? borderRadius;
  double marginLeftAndRight = ScreenUtils.screenW() * 0.11;
  bool barrierDismissible;
  double contentMinHeight;
  EdgeInsets contentEdge;
  EdgeInsets titleEdge;
  Function? negativeFun;
  Function? positiveFun;
  IndexCallBack? indexCallBack;
  DialogButtonGroup dialogButtonGroup;

  ///
  /// Param [bgColor]                         对话框背景颜色
  /// Param [borderRadius]                    对话框圆角
  /// Param [marginLeftAndRight]              弹出层距离左右之间的间距
  /// Param [barrierDismissible]              点击外部区域是否可以取消弹窗
  /// Param [contentMinHeight]                内容区域最小高度
  /// Param [contentEdge]                     设置内容区域的间距
  /// Param [titleEdge]                       设置标题区域的间距
  /// Param [negativeFun]                     设置消极的按钮事件
  /// Param [positiveFun]                     设置积极的按钮事件
  /// Param [indexCallBack]                   当前点击的按钮坐标
  ///
  DialogInfoExtra({
    this.bgColor = Colors.white,
    this.borderRadius = 10,
    this.barrierDismissible = true,
    this.contentMinHeight = 0,
    this.contentEdge = _kcEdgeInsets,
    this.titleEdge = _ktEdgeInsets,
    this.dialogButtonGroup = DialogButtonGroup.DialogButtonNormal,
    this.negativeFun,
    this.positiveFun,
    this.indexCallBack,
  });
}
