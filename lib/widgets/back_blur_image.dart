import 'dart:ui';
import 'package:flutter/material.dart';

/// Shows the [child] on top of the blurred version of the image provider provided
class BackBlurImage extends StatelessWidget {
  final double sigmaX;
  final double sigmaY;
  final ImageProvider imageProvider;
  final Widget child;

  const BackBlurImage({
    Key? key,
    required this.imageProvider,
    required this.child,
    this.sigmaX = 50,
    this.sigmaY = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: sigmaX,
              sigmaY: sigmaY,
              tileMode: TileMode.decal,
            ),
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

extension BackBlurImageExtension on Widget {
  Widget withBackBlurImage({required ImageProvider imageProvider}) {
    return BackBlurImage(imageProvider: imageProvider, child: this);
  }
}
