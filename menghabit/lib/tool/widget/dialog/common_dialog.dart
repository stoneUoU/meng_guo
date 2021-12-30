import 'package:flutter/material.dart';
import 'package:menghabit/tool/constants/colors.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/property/appdialog_extra_property.dart';

class CommonDialog extends Dialog {
  final DialogProperty dialogProperty;

  final border = BorderSide(
      color: Color(0xFFD7D7D7), width: 0.5.px, style: BorderStyle.solid);

  CommonDialog.value(this.dialogProperty);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: dialogProperty.dialogExtra.marginLeftAndRight,
        right: dialogProperty.dialogExtra.marginLeftAndRight,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: ShapeDecoration(
                color: dialogProperty.dialogExtra.bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(dialogProperty.dialogExtra.borderRadius!),
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  /// 标题相关属性
                  Visibility(
                    visible: dialogProperty.titleFontProperty.content
                        .isNotNullOrEmpty(),
                    child: Padding(
                      padding: dialogProperty.dialogExtra.titleEdge,
                      child: Text(
                        dialogProperty.titleFontProperty.content,
                        textAlign: dialogProperty.titleFontProperty.align,
                        style: TextStyle(
                          fontSize: dialogProperty.titleFontProperty.fontSize,
                          color: dialogProperty.titleFontProperty.color,
                          fontWeight:
                              dialogProperty.titleFontProperty.fontWeight,
                          height: dialogProperty.titleFontProperty.height,
                        ),
                      ),
                    ),
                  ),

                  /// 内容相关属性
                  Container(
                    alignment: Alignment.center,
                    padding: dialogProperty.dialogExtra.contentEdge,
                    constraints: BoxConstraints(
                        minHeight: dialogProperty.dialogExtra.contentMinHeight),
                    child: Text(
                      dialogProperty.contentFontProperty.content,
                      textAlign: dialogProperty.contentFontProperty.align,
                      style: TextStyle(
                        fontSize: dialogProperty.contentFontProperty.fontSize,
                        color: dialogProperty.contentFontProperty.color,
                        fontWeight:
                            dialogProperty.contentFontProperty.fontWeight,
                        height: dialogProperty.contentFontProperty.height,
                      ),
                    ),
                  ),
                  this._buildBottomButtonGroup(context),
                  SizedBox(
                    height: 24.px,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtonGroup(BuildContext context) {
    if (dialogProperty.dialogExtra.dialogButtonGroup ==
        DialogButtonGroup.DialogButtonNormal) {
      var widgets = <Widget>[
        NormalBtn(
          dialogProperty.dialogExtra.negativeFun,
          dialogProperty.negativeFontProperty.content,
          dialogProperty.negativeFontProperty.fontSize,
          dialogProperty.negativeFontProperty.fontWeight,
          dialogProperty.negativeFontProperty.color,
          dialogProperty.positiveFontProperty.height,
          colorf2f2f2,
        ),
        SizedBox(
          width: 12.px,
        ),
        NormalBtn(
          dialogProperty.dialogExtra.positiveFun,
          dialogProperty.positiveFontProperty.content,
          dialogProperty.positiveFontProperty.fontSize,
          dialogProperty.positiveFontProperty.fontWeight,
          dialogProperty.positiveFontProperty.color,
          dialogProperty.positiveFontProperty.height,
          color_FF4CD080,
        ),
      ];
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24.px),
        child: Flex(
          direction: Axis.horizontal,
          children: widgets,
        ),
      );
    } else {
      if (dialogProperty.dialogGroupBtn == null) {
        return SizedBox();
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          dialogProperty.dialogGroupBtn!.length,
          (index) => Container(
            width: double.infinity,
            height: 48.px,
            padding: EdgeInsets.symmetric(horizontal: 24.px),
            // decoration: BoxDecoration(
            //   color: Colors.red,
            //   borderRadius: BorderRadius.all(
            //     Radius.circular(8.px),
            //   ),
            // ),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    dialogProperty.dialogGroupBtn![index].btnBg),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        (dialogProperty.dialogGroupBtn![index].radius ?? 8).px,
                      ),
                    ),
                  ),
                ),
              ),
              // style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.pop(context);
                dialogProperty.dialogExtra.indexCallBack!.call(index);
              },
              child: Text(
                dialogProperty.dialogGroupBtn![index].content,
                textAlign: dialogProperty.dialogGroupBtn![index].align,
                style: TextStyle(
                  height: 1,
                  fontSize: dialogProperty.dialogGroupBtn![index].fontSize,
                  fontWeight: dialogProperty.dialogGroupBtn![index].fontWeight,
                  color: dialogProperty.dialogGroupBtn![index].color,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

/// Desc:
/// <p>  对话框中的普通按钮
class NormalBtn extends StatelessWidget {
  // final border = BorderSide(
  //     color: Color(0xFFD7D7D7), width: 0.5.px, style: BorderStyle.solid);

  final Function? fun;
  final String content;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color btnBgColor;
  // final bool needLeftLine;
  final double? height;

  NormalBtn(this.fun, this.content, this.fontSize, this.fontWeight, this.color,
      this.height, this.btnBgColor);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        height: 48.px,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.px),
          ),
        ),
        // decoration: BoxDecoration(
        //     border: needLeftLine
        //         ? Border(top: border, left: border)
        //         : Border(top: border)),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(btnBgColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.px,
                  ),
                ),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            fun!.call();
          },
          child: Text(
            content,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              height: height,
            ),
          ),
        ),
      ),
    );
  }
}
