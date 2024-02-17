import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

/// A button that shows circular progress bar or a custom widget
/// when pressed until the future task is complete. Useful to make show a feedback to the user when they press a button
/// and debounce any incoming press events while the task is in progress.

// Different types of progress button types, following the Material 3 design system
enum ProgressButtonType {
  outlined,
  elevated,
  text,
  icon,
  filled,
  filledTonal,
}

enum ProgressButtonLoadingType {
  // show the loading widget inside the button where the icon is
  showInside,

  // replace the button with the loading widget
  replace
}

class ProgressButton extends StatefulWidget {
  final Widget child;
  final Widget? icon;

  // the gap between the child and the icon
  final double? gap;
  final Widget? loadingWidget;
  final ButtonStyle? style;
  final ProgressButtonType type;
  final Future Function()? onPressed;
  final ProgressButtonLoadingType loadingType;

  const ProgressButton({
    Key? key,
    this.icon,
    required this.onPressed,
    required this.child,
    this.gap,
    this.style,
    this.type = ProgressButtonType.outlined,
    this.loadingType = ProgressButtonLoadingType.showInside,
    this.loadingWidget,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProgressButtonState();
  }
}

class _ProgressButtonWithIconChild extends StatelessWidget {
  final Widget label;
  final Widget icon;
  final double? gap;

  const _ProgressButtonWithIconChild({
    Key? key,
    required this.label,
    required this.icon,
    this.gap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon.fitScaleDown,
        SizedBox(
          width: gap ?? 8,
        ),
        Flexible(child: label),
      ],
    );
  }
}

class _ProgressButtonState extends State<ProgressButton> {
  bool _isLoading = false;
  // required so that we don't get [context] when the element has been destroyed
  bool _isDisposed = false;

  // use [context.mounted] to make sure the widget was not dismissed before or after the
  // widget.onPressed function
  void onPressed() async {
    if (!_isDisposed && context.mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    await widget.onPressed?.call();

    if (!_isDisposed && context.mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loadingWidget = widget.loadingWidget ??
        const Center(child: CircularProgressIndicator.adaptive());
    var onPressedFunction =
        _isLoading ? null : widget.onPressed?.let((it) => onPressed);
    var child = widget.child;

    if (_isLoading && widget.loadingType == ProgressButtonLoadingType.replace) {
      // replace the button with the loading widget,
      // otherwise we show it inside the button
      return loadingWidget;
    }

    if (widget.icon != null ||
        (_isLoading &&
            widget.loadingType == ProgressButtonLoadingType.showInside)) {
      child = _ProgressButtonWithIconChild(
        label: widget.child,
        icon: _isLoading ? loadingWidget : widget.icon ?? empty,
        gap: widget.gap,
      );
    }

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
          icon: child,
        );
      case ProgressButtonType.filled:
        return FilledButton(
          style: widget.style,
          onPressed: onPressedFunction,
          child: child,
        );
      case ProgressButtonType.filledTonal:
        return FilledButton.tonal(
          style: widget.style,
          onPressed: onPressedFunction,
          child: child,
        );
    }
  }
}
