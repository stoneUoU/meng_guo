import 'package:flutter/material.dart';
import 'package:menghabit/menghabit.dart';

class CommonHighLightIconButton extends StatefulWidget {
  final VoidCallback onTap;
  final Size iconSize;
  final String imageName;
  final String? package;
  final double? radius;
  final Color? iconColor;

  CommonHighLightIconButton({
    Key? key,
    required this.onTap,
    Color? highlightColor,
    double? fontSize,
    required this.iconSize,
    required this.imageName,
    this.package,
    this.radius,
    this.iconColor,
  }) : super(key: key);

  @override
  _CommonHighLightIconButtonState createState() =>
      _CommonHighLightIconButtonState();
}

class _CommonHighLightIconButtonState extends State<CommonHighLightIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      // clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(widget.radius != null ? widget.radius! : 16.px))),
      child: InkWell(
        borderRadius: BorderRadius.all(
            Radius.circular(widget.radius != null ? widget.radius! : 16.px)),
        onTap: () {
          widget.onTap();
        },
        child: Image.asset(
          widget.imageName,
          width: widget.iconSize.width,
          height: widget.iconSize.height,
          package: widget.package,
          color: widget.iconColor,
        ),
      ),
    );
  }
}
