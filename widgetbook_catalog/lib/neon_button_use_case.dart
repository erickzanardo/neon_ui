import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonButton)
Widget buildNeonButtonUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeonButton(onPressed: () {}, child: const Text('Primary Button')),
          const SizedBox(height: 16),
          NeonButton(
            type: NeonButtonType.secondary,
            onPressed: () {},
            child: const Text('Secondary Button'),
          ),
          const SizedBox(height: 16),
          const NeonButton(child: Text('Disabled Button')),
        ],
      ),
    ),
  );
}
