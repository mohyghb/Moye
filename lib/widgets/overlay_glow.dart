import 'package:flutter/material.dart';
import 'package:moye/extensions/moye_extensions.dart';

// Shows a glow on top of a given widget
class OverlayGlowWidget extends StatelessWidget {
  final Widget child;
  final List<OverlayGlow> glows;

  const OverlayGlowWidget(
      {Key? key, required this.child, this.glows = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        ...glows.map(
            (e) => Positioned.fromRect(rect: e.rect, child: e.buildGlow())),
      ],
    );
  }
}

// extension to make it easier setting a glow on top of a widget
extension OverlayGlowExtension on Widget {
  OverlayGlowWidget withOverlayGlow({required List<OverlayGlow> glows}) {
    return OverlayGlowWidget(child: this, glows: glows);
  }

  OverlayGlowWidget withHeaderOverlayGlow({
    required BuildContext context,
    Color? color,
    Rect? rect,
    double? blurRadius,
    double height = 25,
  }) {
    return OverlayGlowWidget(
      child: this,
      glows: [
        OverlayGlows.getHeaderGlow(context, color: color, rect: rect, blurRadius: blurRadius, height: height),
      ],
    );
  }
}

class OverlayGlow {
  final BoxShadow boxShadow;
  final Rect rect;

  const OverlayGlow({required this.boxShadow, required this.rect});

  Widget buildGlow() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(boxShadow: [boxShadow]),
    );
  }
}

// Custom made glows helper class
class OverlayGlows {
  static OverlayGlow getHeaderGlow(
    BuildContext context, {
    Color? color,
    Rect? rect,
    double? blurRadius,
    double height = 25,
  }) {
    return OverlayGlow(
      boxShadow: BoxShadow(
        blurRadius: blurRadius ?? 100,
        color: color ?? context.colorScheme.primary.withOpacity(0.75),
      ),
      rect: rect ?? Rect.fromLTWH(0, 0, context.screenWidth, height),
    );
  }
}
