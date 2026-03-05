import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonDialog)
Widget buildNeonDialogUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: NeonButton(
        onPressed: () {
          NeonDialog.show(
            context: context,
            builder: (context) =>
                const Center(child: Text('This is a Neon Dialog')),
          );
        },
        child: const Text('Open Dialog'),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Confirm', type: NeonDialog)
Widget buildNeonDialogConfirmUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: NeonButton(
        onPressed: () {
          NeonDialog.showConfirm(
            context,
            content: 'Are you sure you want to proceed?',
          );
        },
        child: const Text('Open Confirm Dialog'),
      ),
    ),
  );
}
