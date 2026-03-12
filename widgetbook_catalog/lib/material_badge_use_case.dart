import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: Badge)
Widget buildMaterialBadgeUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          Badge(
            label: const Text('1'),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
          Badge(
            label: const Text('99+'),
            child: IconButton(icon: const Icon(Icons.mail), onPressed: () {}),
          ),
          Badge(
            child: IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {},
            ),
          ),
          Badge(
            alignment: Alignment.bottomRight,
            label: const Text('New'),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
          ),
        ],
      ),
    ),
  );
}
