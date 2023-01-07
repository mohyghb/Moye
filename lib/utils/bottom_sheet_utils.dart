import 'package:flutter/material.dart';
import 'package:moye/moye.dart';


/// make it easier to show rounded bottom sheets
class BottomSheetUtils {

  static Future<T?> showBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    Color? backgroundColor,
    bool isScrollControlled = false,
    bool wrap = true,
    BorderRadius borderRadius = BorderRadius.zero,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor ?? context.theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      elevation: elevation,
      clipBehavior: clipBehavior,
      constraints: constraints,
      isDismissible: isDismissible,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      builder: (context) => wrap
          ? Wrap(
              children: [child],
            )
          : child,
    );
  }

}
