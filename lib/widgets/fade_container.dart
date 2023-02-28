import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

/// applies a fade, defaults to bottom fade can specify other parameters to create
/// top, left and right, and other specific fades
class FadeContainer extends StatelessWidget {
  final Widget child;
  final Color? fadeColor;

  // optional for further customization
  final List<Color>? fadeColors;
  final AlignmentGeometry begin, end;
  final List<double>? stops;
  final Rect Function(Rect) shaderRect;

  const FadeContainer({
    Key? key,
    required this.child,
    required this.shaderRect,
    this.fadeColor,
    this.fadeColors,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.stops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          colors: fadeColors ??
              [
                fadeColor ?? context.canvasColor,
                Colors.transparent,
              ],
          begin: begin,
          end: end,
          stops: stops,
        ).createShader(shaderRect(rect));
      },
      blendMode: BlendMode.srcATop,
      child: child,
    );
  }

  // static helper methods
  static FadeContainer topAndBottom({
    required BuildContext context,
    required Widget child,
    Color? fadeColor,
    double startFade = 0.97,
  }) {
    var overlayColor = fadeColor ?? context.colorScheme.background;
    return FadeContainer(
      child: child,
      fadeColors: [
        overlayColor,
        Colors.transparent,
        Colors.transparent,
        overlayColor
      ],
      stops: [
        0,
        (1 - startFade),
        startFade,
        1.0,
      ],
      shaderRect: (rect) => rect,
    );
  }

  static FadeContainer leftAndRight({
    required BuildContext context,
    required Widget child,
    Color? fadeColor,
  }) {
    var overlayColor = fadeColor ?? context.colorScheme.surface;
    return FadeContainer(
      child: child,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      fadeColors: [
        overlayColor,
        Colors.transparent,
        Colors.transparent,
        overlayColor,
      ],
      stops: const [0, 0.25, 0.75, 1.0],
      shaderRect: (rect) => rect,
    );
  }

  static FadeContainer bottom({
    required BuildContext context,
    required Widget child,
    Color? fadeColor,
    double startFade = 0.97,
  }) {
    Color overlayColor = fadeColor ?? context.colorScheme.surface;
    return FadeContainer(
      child: child,
      fadeColors: [Colors.transparent, overlayColor],
      stops: [startFade, 1.0],
      shaderRect: (rect) => rect,
    );
  }
}

extension FadeContainerExtension on Widget {
  Widget withTopAndBottomFade({
    required BuildContext context,
    Color? fadeColor,
    double startFade = 0.97,
  }) {
    return FadeContainer.topAndBottom(
      context: context,
      child: this,
      fadeColor: fadeColor,
      startFade: startFade,
    );
  }

  Widget withBottomFade({
    required BuildContext context,
    Color? fadeColor,
    double startFade = 0.97,
  }) {
    return FadeContainer.bottom(
      context: context,
      child: this,
      fadeColor: fadeColor,
      startFade: startFade,
    );
  }

  Widget withLeftAndRightFade({
    required BuildContext context,
    Color? fadeColor,
  }) {
    return FadeContainer.leftAndRight(
      context: context,
      child: this,
      fadeColor: fadeColor,
    );
  }
}
