import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_ui/neon_ui.dart';

void main() {
  group('NeonChip', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NeonChip(label: 'Chip')),
        ),
      );

      expect(find.byType(NeonChip), findsOneWidget);
      expect(find.text('Chip'), findsOneWidget);
    });

    testWidgets('renders when selected', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NeonChip(label: 'Chip', selected: true)),
        ),
      );

      expect(find.byType(NeonChip), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      final pressed = <bool>[false];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NeonChip(label: 'Chip', onPressed: () => pressed[0] = true),
          ),
        ),
      );

      await tester.tap(find.byType(NeonChip));
      expect(pressed[0], true);
    });

    testWidgets('renders disabled state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NeonChip(label: 'Chip')),
        ),
      );

      expect(find.byType(NeonChip), findsOneWidget);
      expect(find.text('Chip'), findsOneWidget);
    });

    testWidgets('renders with avatar', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NeonChip(
              label: 'Chip',
              avatar: CircleAvatar(child: Text('A')),
            ),
          ),
        ),
      );

      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('renders with delete button', (tester) async {
      final deleted = <bool>[false];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NeonChip(label: 'Chip', onDeleted: () => deleted[0] = true),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
      await tester.tap(find.byIcon(Icons.close));
      expect(deleted[0], true);
    });

    testWidgets('renders with different colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: Colors.red),
          home: const Scaffold(body: NeonChip(label: 'Chip')),
        ),
      );

      expect(find.byType(NeonChip), findsOneWidget);
    });
  });
}
