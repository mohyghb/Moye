import 'package:flutter/material.dart';

/// Overlays a gradient on top of a child, like a [Text]
class GradientOverlay extends StatelessWidget {
  final Gradient gradient;
  final Widget child;

  const GradientOverlay({
    super.key,
    required this.gradient,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return gradient.createShader(rect);
      },
      blendMode: BlendMode.srcATop,
      child: child,
    );
  }
}

extension GradientOverlayExtension on Widget {
  Widget withGradientOverlay({
    required Gradient gradient,
  }) {
    return GradientOverlay(gradient: gradient, child: this);
  }
}
