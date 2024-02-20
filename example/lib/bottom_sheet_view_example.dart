import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

class BottomSheetViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BottomSheetHandle(),
          ProgressButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
            child: const Text('Done'),
            icon: Icon(Icons.done),
          ).withPadding(s16HorizontalPadding)
        ],
      ).withPadding(s32Padding),
    );
  }
}