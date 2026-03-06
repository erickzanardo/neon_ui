import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonCircularProgressIndicator)
Widget buildNeonCircularProgressIndicatorUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeonCircularProgressIndicator(),
          NeonCircularProgressIndicator(color: Colors.blue),
          NeonCircularProgressIndicator(
            color: Colors.yellow,
            strokeWidth: 6,
            radius: 32,
          ),
          NeonCircularProgressIndicator(color: Colors.green, value: 0.7),
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
