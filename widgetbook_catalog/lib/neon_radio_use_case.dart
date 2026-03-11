import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonRadio)
Widget buildNeonRadioUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeonRadio(value: false, onChanged: (_) {}),
          const SizedBox(height: 16),
          NeonRadio(value: true, onChanged: (_) {}),
          const SizedBox(height: 16),
          const NeonRadio(value: false),
        ],
      ),
    ),
  );
}
