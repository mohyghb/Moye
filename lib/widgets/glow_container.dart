import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

/// Adds an outer glow to the given widget
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
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: color ?? context.colorScheme.primary.withOpacity(0.6),
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