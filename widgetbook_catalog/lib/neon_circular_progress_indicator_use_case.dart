import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonCircularProgressIndicator)
Widget buildNeonCircularProgressIndicatorUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeonCircularProgressIndicator(color: Colors.blue),
          const SizedBox(height: 16),
          NeonCircularProgressIndicator(
            color: Colors.yellow,
            strokeWidth: 6,
            radius: 32,
          ),
          const SizedBox(height: 16),
          NeonCircularProgressIndicator(color: Colors.green, value: 0.7),
          const SizedBox(height: 16),
          NeonCircularProgressIndicator(
            color: Colors.purple,
            value: 0.5,
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    ),
  );
}
