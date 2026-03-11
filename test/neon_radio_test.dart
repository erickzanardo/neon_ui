import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_ui/neon_ui.dart';

void main() {
  group('NeonRadio', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NeonRadio(value: false))),
      );

      expect(find.byType(NeonRadio), findsOneWidget);
    });

    testWidgets('renders when selected', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NeonRadio(value: true))),
      );

      expect(find.byType(NeonRadio), findsOneWidget);
    });

    testWidgets('calls onChanged when tapped', (tester) async {
      bool? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NeonRadio(
              value: false,
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NeonRadio));
      expect(changedValue, true);
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      bool? changedValue;
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NeonRadio(value: false))),
      );

      await tester.tap(find.byType(NeonRadio));
      expect(changedValue, isNull);
    });

    testWidgets('renders with different colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: Colors.red),
          home: const Scaffold(body: NeonRadio(value: true)),
        ),
      );

      expect(find.byType(NeonRadio), findsOneWidget);
    });
  });
}
