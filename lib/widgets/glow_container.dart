import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

/// Adds an outer glow to the given widget
/// This is a similar glow that changing the elevation of a widget provides you, however, you can customize the outer glow
/// by [color], [blurRadius], and [spreadRadius]
class GlowContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double blurRadius;
  final double spreadRadius;

  const GlowContainer({
    Key? key,
    this.child,
    this.color,
    this.blurRadius = 30,
    this.spreadRadius = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.transparent,
        boxShadow: [
          BoxShadow(
            color: color ?? context.colorScheme.primary.withAlpha(153),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          )
        ],
      ),
      child: child,
    );
  }
}

extension ContainerGlowExtension on Widget? {
  Widget withGlowContainer({
    Color? color,
    double blurRadius = 30,
    double spreadRadius = 1,
  }) {
    return GlowContainer(
      child: this,
      color: color,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }
}
