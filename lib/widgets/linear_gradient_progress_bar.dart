import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

// a progress bar that can have gradient colors and box shadows
// with animation when value changes
class LinearGradientProgressBar extends StatelessWidget {
  final Duration animationDuration;
  final Gradient gradient;
  final Color? backgroundColor;
  final Color? glowColor;
  final double blurRadius;
  final double spreadRadius;
  final BorderRadius borderRadius;
  final double minHeight;
  final bool enableGlow;

  // value is a percentage (e.g. 0.4 means fill out 40% of the linear progress bar)
  final double value;

  const LinearGradientProgressBar({
    Key? key,
    required this.value,
    required this.gradient,
    this.animationDuration = const Duration(milliseconds: 300),
    this.minHeight = 16,
    this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
    this.blurRadius = 25,
    this.spreadRadius = 3,
    this.glowColor,
    this.enableGlow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: minHeight,
        maxHeight: minHeight,
      ),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor ?? context.colorScheme.background,
        boxShadow: !enableGlow ? [] : [
          BoxShadow(
            color: glowColor ?? gradient.colors.first,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          )
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            width: constraints.maxWidth * value,
            duration: animationDuration,
            decoration: BoxDecoration(gradient: gradient),
          ).alignLeft;
        },
      ),
    );
  }
}
