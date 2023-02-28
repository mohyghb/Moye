import 'dart:ui';
import 'package:flutter/material.dart';

/// Shows the [child] on top of the blurred version of the image provider provided
class BackBlurImage extends StatelessWidget {
  final double? sigmaX;
  final double? sigmaY;
  final ImageProvider imageProvider;
  final Widget child;

  // image properties
  final BoxFit? imageFit;
  final double? imageWidth;
  final double? imageHeight;
  final BlendMode? imageColorBlendMode;
  final Alignment imageAlignment;
  final Color? imageColor;

  const BackBlurImage({
    Key? key,
    required this.imageProvider,
    required this.child,
    this.sigmaX,
    this.sigmaY,
    this.imageFit = BoxFit.cover,
    this.imageWidth,
    this.imageHeight,
    this.imageColorBlendMode,
    this.imageAlignment = Alignment.center,
    this.imageColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: sigmaX ?? 50,
              sigmaY: sigmaY ?? 50,
              tileMode: TileMode.decal,
            ),
            child: Image(
              image: imageProvider,
              fit: this.imageFit,
              width: this.imageWidth,
              height: this.imageHeight,
              colorBlendMode: this.imageColorBlendMode,
              alignment: this.imageAlignment,
              color: this.imageColor,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

extension BackBlurImageExtension on Widget {
  Widget withBackBlurImage({
    required ImageProvider imageProvider,
    double? sigmaX,
    double? sigmaY,
    BoxFit? imageFit = BoxFit.cover,
    double? imageWidth,
    double? imageHeight,
    BlendMode? imageColorBlendMode,
    Alignment imageAlignment = Alignment.center,
    Color? imageColor,
  }) {
    return BackBlurImage(
      imageProvider: imageProvider,
      sigmaY: sigmaY,
      sigmaX: sigmaX,
      child: this,
      imageFit: imageFit,
      imageWidth: imageWidth,
      imageHeight: imageHeight,
      imageAlignment: imageAlignment,
      imageColorBlendMode: imageColorBlendMode,
      imageColor: imageColor,
    );
  }
}
