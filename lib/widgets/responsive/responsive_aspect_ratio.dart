import 'package:flutter/material.dart';

/// A widget that adapts its layout based on the aspect ratio of its constraints.
///
/// This widget takes a list of aspect ratios and a corresponding list of builders.
/// Each builder is used when the aspect ratio of the constraints is less than or equal to the corresponding aspect ratio in the list.
/// If none of the aspect ratios match, the last builder in the list is used.
class ResponsiveAspectRatio extends StatelessWidget {
  /// The list of aspect ratios to use for layout adaptation.
  final List<double> aspectRatios;

  /// The list of builders to use for each aspect ratio.
  final List<LayoutWidgetBuilder> builders;

  /// Creates a new ResponsiveAspectRatio widget.
  ///
  /// The [aspectRatios] and [builders] lists must be the same length.
  const ResponsiveAspectRatio({
    this.aspectRatios = const [],
    this.builders = const [],
    Key? key,
  })  : assert(aspectRatios.length == builders.length, 'Size of breakpoints and builders must be the same'),
        super(key: key);

  /// Creates a new ResponsiveAspectRatio widget with recommended aspect ratios.
  ///
  /// The [smallBuilder] is used when the aspect ratio is less than or equal to 1.
  /// The [mediumBuilder] is used when the aspect ratio is less than or equal to 5/3.
  /// The [largeBuilder] is used when the aspect ratio is less than or equal to 2.
  ResponsiveAspectRatio.recommended({
    required LayoutWidgetBuilder smallBuilder,
    required LayoutWidgetBuilder mediumBuilder,
    required LayoutWidgetBuilder largeBuilder,
    Key? key,
  }) : this(aspectRatios: [1, 5 / 3, 2 / 1], builders: [largeBuilder, mediumBuilder, smallBuilder], key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      double aspectRatio = constraint.maxWidth / constraint.maxHeight;
      for (int i = 0; i < aspectRatios.length; i++) {
        if (aspectRatio <= aspectRatios[i]) {
          return builders[i](context, constraint);
        }
      }
      return builders.last(context, constraint);
    });
  }
}

/// An abstract class that defines methods for building widgets based on the size of the constraints.
abstract class ResponsiveAspectRatioBuilder extends StatelessWidget {

  const ResponsiveAspectRatioBuilder({Key? key}) : super(key: key);

  /// Builds a widget for small constraints.
  Widget buildSmall(BuildContext context, BoxConstraints constraints);

  /// Builds a widget for medium constraints.
  Widget buildMedium(BuildContext context, BoxConstraints constraints);

  /// Builds a widget for large constraints.
  Widget buildLarge(BuildContext context, BoxConstraints constraints);

  @override
  Widget build(BuildContext context) {
    return layout;
  }
}

/// An extension on [ResponsiveAspectRatioBuilder] that provides a convenient way to create a [ResponsiveAspectRatio] widget.
extension ResponsiveAspectRatioExtension on ResponsiveAspectRatioBuilder {
  /// Returns a [ResponsiveAspectRatio] widget that uses the methods of this [ResponsiveAspectRatioBuilder] to build its children.
  ResponsiveAspectRatio get layout => ResponsiveAspectRatio.recommended(
    smallBuilder: buildSmall,
    mediumBuilder: buildMedium,
    largeBuilder: buildLarge,
  );
}