library easy_ui;

import 'package:flutter/material.dart';

/// extension of the [num] to contain more useful helper methods and getters
extension MoyeNumberExtension on num {
  /// returns an [EdgeInsets] that includes this number as a padding for all sides
  EdgeInsets get allInset {
    return EdgeInsets.all(this.toDouble());
  }

  /// returns an [EdgeInsets] that uses [num] as for horizontal insets
  EdgeInsets get horizontalInset =>
      EdgeInsets.symmetric(horizontal: this.toDouble());

  /// returns an [EdgeInsets] that uses [num] as for vertical insets
  EdgeInsets get verticalInset =>
      EdgeInsets.symmetric(vertical: this.toDouble());

  EdgeInsets get bottomInset => EdgeInsets.only(bottom: this.toDouble());

  EdgeInsets get rightInset => EdgeInsets.only(right: this.toDouble());

  EdgeInsets get leftInset => EdgeInsets.only(left: this.toDouble());

  EdgeInsets get topInset => EdgeInsets.only(top: this.toDouble());

  /// creates a [Widget] that has this [num] as its height
  Widget get heightBox => SizedBox(height: this.toDouble());

  /// creates a [SizedBox] that has this [num] as its width
  Widget get widthBox => SizedBox(width: this.toDouble());

  /// creates an [Expanded] Widget with [SizedBox] as its child and has this [num] as it's flex
  Widget get expanded => Expanded(flex: this.toInt(), child: const SizedBox());
}

extension MoyeWidgetExtension on Widget {
  /// Makes this widget have round corners. You could also specify [border]
  Widget withRoundCorners({BoxBorder? border, BorderRadius? borderRadius}) {
    Widget clipR = ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: this,
    );
    return border == null
        ? clipR
        : Container(
            child: clipR,
            decoration:
                BoxDecoration(border: border, borderRadius: borderRadius),
          );
  }

  /// Wrap this widget with a Expanded Widget
  Expanded get expanded {
    return Expanded(child: this);
  }

  /// Wrap this widget with a Expanded Widget and specify a [flex] for it
  Expanded expandedWith(int flex) {
    return Expanded(flex: flex, child: this);
  }

  /// Wrap this widget with a padding for a given [EdgeInsetsGeometry]
  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  /// Wrap this widget with a sliver padding for a given [EdgeInsetsGeometry]
  Widget withSliverPadding(EdgeInsetsGeometry padding) {
    return SliverPadding(padding: padding, sliver: this);
  }

  /// Set the height of this widget set to [height] by wrapping it inside a [SizedBox]
  Widget withHeight(double? height) {
    return SizedBox(height: height, child: this);
  }

  /// Set the min height of this widget to [minHeight] by wrapping it inside a [ConstrainedBox]
  Widget withMinHeight(double minHeight) {
    return ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight), child: this);
  }

  /// Set the width of this widget set to [width] by wrapping it inside a [SizedBox]
  Widget withWidth(double? width) {
    return SizedBox(width: width, child: this);
  }

  /// Set the min width of this widget to [minWidth] by wrapping it inside a [ConstrainedBox]
  Widget withMinWidth(double minWidth) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: minWidth), child: this);
  }

  /// Wrap this widget with a [ConstrainedBox], and set it's constraints to [constraints]
  Widget withConstraints(BoxConstraints constraints) {
    return ConstrainedBox(constraints: constraints, child: this);
  }

  /// The number of clockwise quarter turns the child should be rotated.
  Widget rotate(int quarterTurns) {
    return RotatedBox(quarterTurns: quarterTurns, child: this);
  }

  /// sliver extensions for widget (converts a widget to sliver)
  SliverToBoxAdapter get asSliver => SliverToBoxAdapter(child: this);

  /// Detect taps on a widget easily
  Widget onTap({VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  /// Give a size to this widget
  Widget withSize({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }

  /// Show the widget with the given [aspectRatio]
  Widget withAspectRatio({required double aspectRatio}) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: this,
    );
  }

  /// Wraps this inside a [Flexible]
  Widget withFlexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: this,
    );
  }
}

/// Extensions about aligning widgets on screen
extension MoyeAlignWidgetExtension on Widget {
  Align align(AlignmentGeometry alignmentGeometry) =>
      Align(alignment: alignmentGeometry, child: this);

  Align get alignCenter => Align(alignment: Alignment.center, child: this);

  Align get alignBottom =>
      Align(alignment: Alignment.bottomCenter, child: this);

  Align get alignBottomLeft =>
      Align(alignment: Alignment.bottomLeft, child: this);

  Align get alignBottomRight =>
      Align(alignment: Alignment.bottomRight, child: this);

  Align get alignRight => Align(alignment: Alignment.centerRight, child: this);

  Align get alignTop => Align(alignment: Alignment.topCenter, child: this);

  Align get alignTopLeft => Align(alignment: Alignment.topLeft, child: this);

  Align get alignTopRight => Align(alignment: Alignment.topRight, child: this);

  Align get alignLeft => Align(alignment: Alignment.centerLeft, child: this);
}

/// Extension about fitting widgets
extension MoyeFitWidgetExtension on Widget {
  Widget get fit => FittedBox(child: this);

  Widget get fitWidth => FittedBox(fit: BoxFit.fitWidth, child: this);

  Widget get fitHeight => FittedBox(fit: BoxFit.fitHeight, child: this);

  Widget get fitCover => FittedBox(fit: BoxFit.cover, child: this);

  Widget get fitFill => FittedBox(fit: BoxFit.fill, child: this);

  Widget get fitScaleDown => FittedBox(fit: BoxFit.scaleDown, child: this);
}

/// An extension for a context
extension MoyeContextExtension on BuildContext {
  // Size extensions
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  Size get screenSize => MediaQuery.sizeOf(this);

  bool get isThemeDark => Theme.of(this).brightness == Brightness.dark;

  Color get canvasColor => Theme.of(this).canvasColor;

  TextTheme get textTheme => Theme.of(this).textTheme;

  TargetPlatform get platform => Theme.of(this).platform;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Brightness get brightness => Theme.of(this).brightness;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

/// Extension for text styles to make everything easier
extension MoyeTextStyleExtension on TextStyle? {
  /// Make this TextStyle font bold
  TextStyle? get bold => this?.copyWith(fontWeight: FontWeight.bold);

  /// set the color of this TextStyle to [color]
  TextStyle? withColor(Color? color) {
    return this?.copyWith(color: color);
  }
}

typedef LetInvokableFunction<R, T> = R Function(T it);
typedef AlsoInvokableFunction<T> = Function(T it);

/// Extensions to make null safety easier to deal with
extension NullSafetyExtension<T> on T {
  /// Kotlin style of coding
  /// This could be used on the Nullable objects to do some operation on it
  /// after we make sure that it's not null
  R let<R>(LetInvokableFunction<R, T> f) {
    return f(this);
  }

  T also(AlsoInvokableFunction<T> f) {
    f(this);
    return this;
  }
}
