import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonDecoratedBox)
Widget buildNeonDecoratedBoxUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: NeonDecoratedBox(
        color: Colors.cyanAccent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Neon Decorated Box'),
        ),
      ),
    ),
  );
}
