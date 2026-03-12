import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_ui/neon_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NeonUITheme', () {
    testWidgets('toThemeData returns correct inputDecorationTheme', (
      tester,
    ) async {
      final theme = NeonUITheme(primaryColor: Colors.pink);
      await tester.pumpWidget(
        MaterialApp(
          theme: theme.toThemeData(),
          home: const Scaffold(body: Text('test')),
        ),
      );
      final themeData = Theme.of(tester.element(find.text('test')));

      expect(themeData.inputDecorationTheme.border, isA<OutlineInputBorder>());
      expect(
        themeData.inputDecorationTheme.contentPadding,
        const EdgeInsets.symmetric(horizontal: 8),
      );
    });

    testWidgets(
      'toThemeData returns theme data with black scaffold background',
      (tester) async {
        final theme = NeonUITheme(primaryColor: Colors.pink);
        await tester.pumpWidget(
          MaterialApp(
            theme: theme.toThemeData(),
            home: const Scaffold(body: Text('test')),
          ),
        );
        final themeData = Theme.of(tester.element(find.text('test')));

        expect(themeData.scaffoldBackgroundColor, Colors.black);
      },
    );
  });
}
