import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonDivider)
Widget buildNeonDividerUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Above Divider'),
          const SizedBox(height: 16),
          const NeonDivider(),
          const SizedBox(height: 16),
          const Text('Below Divider'),
          const SizedBox(height: 32),
          const Text('With Custom Color'),
          const SizedBox(height: 16),
          const NeonDivider(color: Colors.pink),
          const SizedBox(height: 16),
          const Text('With Indent'),
          const SizedBox(height: 16),
          const NeonDivider(indent: 32, endIndent: 32),
        ],
      ),
    ),
  );
}
