import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonPressable)
Widget buildNeonPressableUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeonPressable(
            onPressed: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Pressable'),
            ),
          ),
          const SizedBox(height: 16),
          NeonPressable(
            onPressedDown: () {},
            onPressedUp: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('With callbacks'),
            ),
          ),
          const SizedBox(height: 16),
          const NeonPressable(child: Text('Disabled Pressable')),
        ],
      ),
    ),
  );
}
