import 'package:flutter/material.dart';

/// 充满的button

class BaseFlexButton extends StatelessWidget {
  final String text;

  final Color color;

  final Color textColor;

  final VoidCallback onPress;

  final double fontSize;
  final int maxLines;

  final MainAxisAlignment mainAxisAlignment;

  BaseFlexButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.onPress,
      this.fontSize = 20.0,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: new EdgeInsets.only(
        left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),child: new ElevatedButton(
        style: ButtonStyle(backgroundColor:MaterialStateProperty.all(color),foregroundColor:MaterialStateProperty.all(textColor )),
        child: new Flex(
          mainAxisAlignment: mainAxisAlignment,
          direction: Axis.horizontal,
          children: <Widget>[
            new Expanded(
              child: new Text(text,
                  style: new TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.center,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
        onPressed: () {
          this.onPress.call();
        }),);
  }
}
