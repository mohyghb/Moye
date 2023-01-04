import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

/// A button that shows circular progress bar or a custom widget
/// when pressed until the future task is complete

enum ProgressButtonType { outlined, elevated, text, icon }

class ProgressButton extends StatefulWidget {
  final Widget child;
  final Widget? loadingWidget;
  final ButtonStyle? style;
  final ProgressButtonType type;
  final Future Function()? onPressed;

  const ProgressButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style,
    this.type = ProgressButtonType.elevated,
    this.loadingWidget,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProgressButtonState();
  }
}

class _ProgressButtonState extends State<ProgressButton> {
  bool _isLoading = false;

  void onPressed() async {
    setState(() {
      _isLoading = true;
    });

    await widget.onPressed?.call();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return widget.loadingWidget ??
          const Center(child: CircularProgressIndicator());
    }

    var onPressedFunction = widget.onPressed?.let((it) => onPressed);
    var child = widget.child;

    switch (widget.type) {
      case ProgressButtonType.outlined:
        return OutlinedButton(
          style: widget.style,
          onPressed: onPressedFunction,
          child: child,
        );
      case ProgressButtonType.elevated:
        return ElevatedButton(
          style: widget.style,
          onPressed: onPressedFunction,
          child: child,
        );
      case ProgressButtonType.text:
        return TextButton(
          style: widget.style,
          onPressed: onPressedFunction,
          child: child,
        );
      case ProgressButtonType.icon:
        return IconButton(
          onPressed: onPressedFunction,
          icon: widget.child,
        );
    }
  }
}
