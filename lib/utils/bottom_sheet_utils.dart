import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

/// [controller] is only present if using the ScrollableBottomSheetType
typedef BottomSheetChildBuilder = Widget Function(BuildContext context, ScrollController? controller);

abstract class BottomSheetConfig {
  final bool isScrollControlled;
  final bool enableDrag;
  final BottomSheetChildBuilder builder;

  // adjusts the bottom padding of bottom sheet to the keyboard opening
  final bool adjustToKeyboardChanges;

  const BottomSheetConfig({
    required this.isScrollControlled,
    required this.enableDrag,
    required this.builder,
    this.adjustToKeyboardChanges = true,
  });

  Widget build(BuildContext context);
}

/// The default bottom sheet config. It doesn't wrap the content, neither does it make them scrollable.
class DefaultBottomSheetConfig extends BottomSheetConfig {
  const DefaultBottomSheetConfig({
    required super.builder,
    super.isScrollControlled = false,
    super.enableDrag = true,
    // need to wrap the builder with a scroll controller, otherwise the adjustments
    // for keyboard changes wouldn't work
    super.adjustToKeyboardChanges,
  });

  @override
  Widget build(BuildContext context) {
    return super.builder(context, null).withPadding(
          super.adjustToKeyboardChanges ? context.mediaQuery.viewInsets : EdgeInsets.zero,
        );
  }
}

/// A bottom sheet config that wraps its content based on tall the content is
class WrapBottomSheetConfig extends BottomSheetConfig {
  const WrapBottomSheetConfig({
    required super.builder,
    super.isScrollControlled = true,
    super.enableDrag = true,
    super.adjustToKeyboardChanges,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        super.builder(context, null),
      ],
    ).withPadding(super.adjustToKeyboardChanges ? context.mediaQuery.viewInsets : EdgeInsets.zero);
  }
}

/// A bottom sheet config that has a scrollable content inside of it
/// The builder provides a [ScrollController] that can be used to be attached to the content of the bottom sheet for better
/// scrolling behaviour
class ScrollableBottomSheetConfig extends BottomSheetConfig {
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final bool expand;
  final bool snap;
  final List<double>? snapSizes;
  final DraggableScrollableController? controller;

  const ScrollableBottomSheetConfig({
    required super.builder,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 1.0,
    this.expand = false,
    this.snap = true,
    this.snapSizes,
    this.controller,
    super.isScrollControlled = true,
    super.enableDrag = true,
    // need to wrap the builder with a scroll controller, otherwise the adjustments
    // for keyboard changes wouldn't work
    super.adjustToKeyboardChanges,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: expand,
      snap: snap,
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      snapSizes: snapSizes,
      builder: (BuildContext context, ScrollController scrollController) {
        return super.builder(context, scrollController);
      },
    ).withPadding(super.adjustToKeyboardChanges ? context.mediaQuery.viewInsets : EdgeInsets.zero);
  }
}

/// Utilities to show bottom sheets effortlessly
class BottomSheetUtils {
  static Future<T?> showBottomSheet<T>({
    required BuildContext context,
    required BottomSheetConfig config,
    Color? backgroundColor,
    BorderRadius borderRadius = BorderRadius.zero,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool useRootNavigator = false,
    bool isDismissible = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      enableDrag: config.enableDrag,
      isScrollControlled: config.isScrollControlled,
      backgroundColor: backgroundColor ?? context.theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      elevation: elevation,
      clipBehavior: clipBehavior,
      constraints: constraints,
      isDismissible: isDismissible,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      builder: config.build,
    );
  }
}
