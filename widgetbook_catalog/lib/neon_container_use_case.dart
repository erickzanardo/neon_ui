import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonContainer)
Widget buildNeonContainerUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeonContainer(child: const Text('Default Container')),
          const SizedBox(height: 16),
          NeonContainer(
            backgroundColor: Colors.blue.shade900,
            padding: 24,
            width: 200,
            height: 100,
            child: const Text('Custom Container'),
          ),
        ],
      ),
    ),
  );
}
