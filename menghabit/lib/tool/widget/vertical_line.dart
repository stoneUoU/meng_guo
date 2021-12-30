import 'package:flutter/material.dart' hide Action;

class VerticalLine extends StatelessWidget {
  final Color dividerColor;
  final double height;
  final double width;

  VerticalLine({required this.dividerColor, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: dividerColor,
      height: height ,
    );
  }
}
