import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/material.dart';

class TopTipText extends SpecialText {
  TopTipText(TextStyle? textStyle, {this.showAtBackground = false, this.start})
      : super(flag, flag, textStyle ?? const TextStyle(color: Colors.red));
  static const String flag = '#';
  final int? start;

  /// whether show background for @somebody
  final bool showAtBackground;

  @override
  InlineSpan finishText() {
    final TextStyle? textStyle =
        this.textStyle?.copyWith(color: Colors.blue, fontSize: 16.0);

    final String TopTipText = toString();

    return showAtBackground
        ? BackgroundTextSpan(
            background: Paint()..color = Colors.blue.withOpacity(0.15),
            text: TopTipText,
            actualText: TopTipText,
            start: start!,

            ///caret can move into special text
            deleteAll: true,
            style: textStyle,
            // recognizer: (TapGestureRecognizer()
            //   ..onTap = () {
            //     if (onTap != null) {
            //       onTap!(TopTipText);
            //     }
            //   }),
          )
        : SpecialTextSpan(
            text: TopTipText,
            actualText: TopTipText,
            start: start!,
            style: textStyle,
            // recognizer: (TapGestureRecognizer()
            //   ..onTap = () {
            //     if (onTap != null) {
            //       onTap!(TopTipText);
            //     }
            //   }),
          );
  }
}
