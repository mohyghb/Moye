import 'package:flutter/material.dart';


class UIConstants {

  static const double extraSmall = 4;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
  static const double extraLarge = 32;

  /// horizontal padding constants
  static const EdgeInsets extraSmallHorizontalPadding = const EdgeInsets.symmetric(horizontal: extraSmall);
  static const EdgeInsets smallHorizontalPadding = const EdgeInsets.symmetric(horizontal: small);
  static const EdgeInsets mediumHorizontalPadding = const EdgeInsets.symmetric(horizontal: medium);
  static const EdgeInsets largeHorizontalPadding = const EdgeInsets.symmetric(horizontal: large);
  static const EdgeInsets extraLargeHorizontalPadding = const EdgeInsets.symmetric(horizontal: extraLarge);

  /// vertical padding constants
  static const EdgeInsets extraSmallVerticalPadding = const EdgeInsets.symmetric(vertical: extraSmall);
  static const EdgeInsets smallVerticalPadding = const EdgeInsets.symmetric(vertical: small);
  static const EdgeInsets mediumVerticalPadding = const EdgeInsets.symmetric(vertical: medium);
  static const EdgeInsets largeVerticalPadding = const EdgeInsets.symmetric(vertical: large);
  static const EdgeInsets extraLargeVerticalPadding = const EdgeInsets.symmetric(vertical: extraLarge);

  /// all insets padding constants
  static const EdgeInsets extraSmallPadding = const EdgeInsets.all(extraSmall);
  static const EdgeInsets smallPadding = const EdgeInsets.all(small);
  static const EdgeInsets mediumPadding = const EdgeInsets.all(medium);
  static const EdgeInsets largePadding = const EdgeInsets.all(large);
  static const EdgeInsets extraLargePadding = const EdgeInsets.all(extraLarge);


  /// height boxes
  static const SizedBox extraSmallHeightBox = const SizedBox(height: extraSmall);
  static const SizedBox smallHeightBox = const SizedBox(height: small);
  static const SizedBox mediumHeightBox = const SizedBox(height: medium);
  static const SizedBox largeHeightBox = const SizedBox(height: large);
  static const SizedBox extraLargeHeightBox = const SizedBox(height: extraLarge);

  /// width boxes
  static const SizedBox extraSmallWidthBox = const SizedBox(width: extraSmall);
  static const SizedBox smallWidthBox = const SizedBox(width: small);
  static const SizedBox mediumWidthBox = const SizedBox(width: medium);
  static const SizedBox largeWidthBox = const SizedBox(width: large);
  static const SizedBox extraLargeWidthBox = const SizedBox(width: extraLarge);
}