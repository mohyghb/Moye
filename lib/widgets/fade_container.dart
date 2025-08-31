import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

/// Applies a fade to a widget, defaults to bottom fade can specify other parameters to create
/// top, left and right, and other specific fades
/// Good for when trying to make the scrollable content fade out at the bottom of your screen or list view
class FadeContainer extends StatelessWidget {
  final Widget child;
  final List<Color> fadeColors;
  // Which angle the fade should start and end
  final AlignmentGeometry begin, end;
  final List<double>? stops;
  final Rect Function(Rect) shaderRect;
  final BlendMode blendMode;

  const FadeContainer({
    Key? key,
    required this.child,
    required this.shaderRect,
    required this.fadeColors,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.stops,
    this.blendMode = BlendMode.srcATop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          colors: fadeColors,
          begin: begin,
          end: end,
          stops: stops,
        ).createShader(shaderRect(rect));
      },
      blendMode: blendMode,
      child: child,
    );
  }
}

extension FadeContainerExtension on Widget {
  Widget withTopAndBottomFade({
    required BuildContext context,
    Color? fadeColor,
    double startFade = 0.97,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    List<double>? stops,
    Rect Function(Rect)? shaderRect,
    BlendMode? blendMode,
  }) {
    var overlayColor = fadeColor ?? Theme.of(context).colorScheme.surface;
    return FadeContainer(
      child: this,
      fadeColors: [
        overlayColor,
        context.transparent,
        context.transparent,
        overlayColor
      ],
      begin: begin ?? Alignment.topCenter,
      end: end ?? Alignment.bottomCenter,
      stops: stops ?? [
        0,
        (1 - startFade),
        startFade,
        1.0,
      ],
      shaderRect: shaderRect ?? (rect) => rect,
      blendMode: blendMode ?? BlendMode.srcATop,
    );
  }

  Widget withBottomFade({
    required BuildContext context,
    Color? fadeColor,
    double startFade = 0.97,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    List<double>? stops,
    Rect Function(Rect)? shaderRect,
    BlendMode? blendMode,
  }) {
    Color overlayColor = fadeColor ?? Theme.of(context).colorScheme.surface;
    return FadeContainer(
      child: this,
      fadeColors: [context.transparent, overlayColor],
      begin: begin ?? Alignment.topCenter,
      end: end ?? Alignment.bottomCenter,
      stops: stops ?? [startFade, 1.0],
      shaderRect: shaderRect ?? (rect) => rect,
      blendMode: blendMode ?? BlendMode.srcATop,
    );
  }

  Widget withLeftAndRightFade({
    required BuildContext context,
    Color? fadeColor,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    List<double>? stops,
    Rect Function(Rect)? shaderRect,
    BlendMode? blendMode,
  }) {
    var overlayColor = fadeColor ?? Theme.of(context).colorScheme.surface;
    return FadeContainer(
      child: this,
      begin: begin ?? Alignment.centerLeft,
      end: end ?? Alignment.centerRight,
      fadeColors: [
        overlayColor,
        context.transparent,
        context.transparent,
        overlayColor,
      ],
      stops: stops ?? const [0, 0.25, 0.75, 1.0],
      shaderRect: shaderRect ?? (rect) => rect,
      blendMode: blendMode ?? BlendMode.srcATop,
    );
  }

  Widget withTopFade({
    required BuildContext context,
    Color? fadeColor,
    double stopFade = 0.03,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    List<double>? stops,
    Rect Function(Rect)? shaderRect,
    BlendMode? blendMode,
  }) {
    Color overlayColor = fadeColor ?? Theme.of(context).colorScheme.surface;
    return FadeContainer(
      child: this,
      begin: begin ?? Alignment.topCenter,
      end: end ?? Alignment.bottomCenter,
      fadeColors: [
        overlayColor,
        context.transparent,
      ],
      stops: stops ?? [0, stopFade],
      shaderRect: shaderRect ?? (rect) => rect,
      blendMode: blendMode ?? BlendMode.srcATop,
    );
  }

  Widget withFadeContainer({
    required BuildContext context,
    required List<Color> fadeColors,
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    List<double>? stops,
    Rect Function(Rect)? shaderRect,
    BlendMode blendMode = BlendMode.srcATop,
  }) {
    return FadeContainer(
      child: this,
      fadeColors: fadeColors,
      begin: begin,
      end: end,
      stops: stops,
      shaderRect: shaderRect ?? (rect) => rect,
      blendMode: blendMode,
    );
  }
}
