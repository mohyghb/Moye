import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

/// Default bottom sheet handle provided to make it easier in showing a handle for the bottom sheet
class BottomSheetHandle extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color? handleColor;
  final BorderRadius? borderRadius;

  const BottomSheetHandle({
    Key? key,
    this.width = 55,
    this.height = 4.5,
    this.padding = s16Padding,
    this.handleColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: padding,
      decoration: BoxDecoration(
        color:
            handleColor ?? context.colorScheme.onSurface.withOpacity(0.75),
        borderRadius: borderRadius ?? BorderRadius.circular(25),
      ),
    );
  }
}
