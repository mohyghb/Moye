import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_ui/extensions/array_extension.dart';

/// This stateless widget will allow the developers to develop for multiple screen
/// sizes. You can create [breakpoints], the points in which the auto-layout should
/// use that widget when the screen size is within those thresholds
///
/// if no [breakpoints] is provided, return a container
class AutoLayout extends StatelessWidget {
  final List<double> breakpoints;
  final List<LayoutWidgetBuilder> builders;

  AutoLayout({this.breakpoints = const [], this.builders = const [], Key? key})
      : assert(breakpoints.length == builders.length, 'Size of breakpoints and builders must be the same'),
        assert(breakpoints.isAscendingOrder, 'Breakpoints should be in ascending order for auto layout to be able to use them'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      double width = constraint.maxWidth;
      for (int i = 0; i < breakpoints.length; i++) {
        if (_showSmallest(i, width)) {
          // width is less than or equal to the smallest dimension
          return builders[i](context, constraint);
        } else if (_showLargest(i, width)) {
          // width is greater than or equal to the largest dimension
          return builders[i](context, constraint);
        } else if (width <= breakpoints[i]) {
          // width is between two different dimensions
          return builders[i](context, constraint);
        }
      }
      return Container(
        color: Theme.of(context).errorColor,
      );
    });
  }

  bool _showSmallest(int i, double width) => i == 0 && width <= breakpoints[i];

  bool _showLargest(int i, double width) => i == breakpoints.length - 1 && width >= breakpoints[i];
}
