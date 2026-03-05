import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonIcon)
Widget buildNeonIconUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeonIcon(icon: Icons.home, color: Colors.blue),
          const SizedBox(height: 16),
          NeonIcon(icon: Icons.star, color: Colors.yellow, size: 48),
          const SizedBox(height: 16),
          NeonIcon.undecorated(icon: Icons.settings, color: Colors.green),
        ],
      ),
    ),
  );
}
