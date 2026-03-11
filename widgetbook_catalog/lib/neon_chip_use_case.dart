import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonChip)
Widget buildNeonChipUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          NeonChip(label: 'Chip'),
          NeonChip(label: 'Selected Chip', selected: true),
          NeonChip(
            label: 'With Avatar',
            avatar: const CircleAvatar(child: Text('A')),
          ),
          NeonChip(label: 'Deletable', onDeleted: () {}),
        ],
      ),
    ),
  );
}
