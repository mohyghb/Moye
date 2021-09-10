library easy_ui;

import 'package:flutter/material.dart';

/// extension of the [num] to contain more useful helper methods and getters
extension EasyUINumberExtension on num {
// START Padding helpers
  /// returns an [EdgeInsets] that includes this number as a padding for all sides
  EdgeInsets get allInset {
    return EdgeInsets.all(this.toDouble());
  }

  /// returns an [EdgeInsets] that uses [num] as for horizontal insets
  EdgeInsets get horizontalInset => EdgeInsets.symmetric(horizontal: this.toDouble());

  /// returns an [EdgeInsets] that uses [num] as for vertical insets
  EdgeInsets get verticalInset => EdgeInsets.symmetric(vertical: this.toDouble());

  EdgeInsets get bottomInset => EdgeInsets.only(bottom: this.toDouble());
  EdgeInsets get rightInset => EdgeInsets.only(right: this.toDouble());
  EdgeInsets get leftInset => EdgeInsets.only(left: this.toDouble());
  EdgeInsets get topInset => EdgeInsets.only(top: this.toDouble());

// End Padding helpers

// START Widget helpers
  /// creates a [Widget] that has this [num] as its height
  Widget get heightBox => SizedBox(height: this.toDouble());

  /// creates a [SizedBox] that has this [num] as its width
  Widget get widthBox => SizedBox(width: this.toDouble());

  /// creates an [Expanded] Widget with [SizedBox] as its child and has this [num] as it's flex
  Widget get expanded => Expanded(flex: this.toInt(), child: const SizedBox());
// END Widget helpers

}
