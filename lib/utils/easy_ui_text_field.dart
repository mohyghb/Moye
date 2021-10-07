import 'package:flutter/material.dart';

/// abstract helper that helps us build new text fields easily
class TextFields {
  static TextFormField build({
    TextEditingController? controller,
    Widget? icon,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
    bool obscureText = false,
    FocusNode? focusNode,
    ValueChanged? onChanged,
    VoidCallback? onTap,
    FormFieldValidator<String>? validator,
    AutovalidateMode? autovalidateMode,
    int? maxLength,
    String? counterText,
    int? minLines,
    int? maxLines,
    TextInputAction? textInputAction
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      obscureText: obscureText,
      maxLength: maxLength,
      focusNode: focusNode,
      onChanged: onChanged,
      onTap: onTap,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          icon: icon,
          labelText: labelText,
          suffixIcon: suffixIcon,
          hintText: hintText,
          counterText: counterText
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}