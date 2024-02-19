import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

class ShowcaseWidget extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? description;

  const ShowcaseWidget({
    required this.child,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null) Text(title ?? '', style: context.textTheme.titleLarge),
          if (description != null) ...[
            Text(description ?? '', style: context.textTheme.bodyMedium),
            s16HeightBox,
          ],
          child,
        ],
      ).withPadding(s16Padding),
    );
  }
}
