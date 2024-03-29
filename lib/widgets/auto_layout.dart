import 'package:flutter/material.dart';
import 'package:moye/extensions/array_extension.dart';

/// This stateless widget will allow the developers to develop for multiple screen
/// sizes. You can create [breakpoints], the points in which the auto-layout should
/// use that widget when the screen size is within those thresholds
///
/// if no [breakpoints] is provided, return a container
///
///
/// It is important to note that this widget relies on [LayoutBuilder] and it can
/// work for nested widgets as well (not only for full screens). So you can utilize this
/// widget differently based on your needs
class AutoLayout extends StatelessWidget {
  final List<double> breakpoints;
  final List<LayoutWidgetBuilder> builders;

  AutoLayout({
    this.breakpoints = const [],
    this.builders = const [],
    Key? key,
  })  : assert(breakpoints.length == builders.length,
            'Size of breakpoints and builders must be the same'),
        assert(breakpoints.isAscendingOrder,
            'Breakpoints should be in ascending order for auto layout to be able to use them'),
        super(key: key);

  AutoLayout.recommended({
    required LayoutWidgetBuilder smallBuilder,
    required LayoutWidgetBuilder mediumBuilder,
    required LayoutWidgetBuilder largeBuilder,
    Key? key,
  }) : this(
            breakpoints: AutoLayoutHelper.DEFAULT_SCREEN_SIZES,
            builders: [smallBuilder, mediumBuilder, largeBuilder],
            key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      double width = constraint.maxWidth;
      for (int i = 0; i < breakpoints.length; i++) {
        if (width <= breakpoints[i]) {
          return builders[i](context, constraint);
        }
      }
      return builders.last(context, constraint);
    });
  }
}

/// A helper for [AutoLayout] to make it easier develop for different screen sizes.
class AutoLayoutHelper {
  /// values less than 300 are considered [NARROW]
  static const double NARROW = 300;

  /// values between (300 - 650) are considered [SMALL]
  static const double SMALL = 650;

  /// values between (650 - 950) are considered [MEDIUM]
  static const double MEDIUM = 950;

  /// values after 950 are considered [LARGE]
  static const double LARGE = 950;

  /// default screen sizes as a list so that you can use it as the [AutoLayout.breakpoints]
  static const List<double> DEFAULT_SCREEN_SIZES = [SMALL, MEDIUM, LARGE];

  /// returns true if the [width] is in the [NARROW] range
  static bool isNarrow(double width) {
    return width <= NARROW;
  }

  /// returns true if the [width] is in the [SMALL] range
  static bool isSmall(double width) {
    return width > NARROW && width <= SMALL;
  }

  /// returns true if the [width] is in the [MEDIUM] range
  static bool isMedium(double width) {
    return width > SMALL && width <= MEDIUM;
  }

  /// returns true if the [width] is greater than [MEDIUM]
  static bool isLarge(double width) {
    return width > MEDIUM;
  }
}

/// An interface to make it easier to implement auto layout capabilities
abstract class IAutoLayout {
  Widget buildSmall(BuildContext context, BoxConstraints constraints);

  Widget buildMedium(BuildContext context, BoxConstraints constraints);

  Widget buildLarge(BuildContext context, BoxConstraints constraints);
}

/// an extension to make it easier to build an AutoLayout from IAutoLayout interface
extension AutoLayoutExtension on IAutoLayout {
  AutoLayout get layout => AutoLayout.recommended(
        smallBuilder: this.buildSmall,
        mediumBuilder: this.buildMedium,
        largeBuilder: this.buildLarge,
      );
}
