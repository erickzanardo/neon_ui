import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_ui/neon_ui.dart';

void main() {
  group('NeonCircularProgressIndicator', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NeonCircularProgressIndicator()),
        ),
      );

      expect(find.byType(NeonCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with custom color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NeonCircularProgressIndicator(color: Colors.red),
          ),
        ),
      );

      expect(find.byType(NeonCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with value (determinate)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NeonCircularProgressIndicator(value: 0.5)),
        ),
      );

      expect(find.byType(NeonCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with custom stroke width', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NeonCircularProgressIndicator(strokeWidth: 8.0)),
        ),
      );

      expect(find.byType(NeonCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with custom radius', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NeonCircularProgressIndicator(radius: 32.0)),
        ),
      );

      expect(find.byType(NeonCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with background color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NeonCircularProgressIndicator(
              backgroundColor: Colors.grey,
              value: 0.5,
            ),
          ),
        ),
      );

      expect(find.byType(NeonCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('uses theme values when not provided', (tester) async {
      final theme = NeonUITheme(
        primaryColor: Colors.pink,
        circularProgressIndicatorTheme:
            const NeonCircularProgressIndicatorTheme(
              strokeWidth: 6.0,
              radius: 40.0,
              blurSigma: 8.0,
            ),
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: theme.toThemeData(),
          home: const Scaffold(body: NeonCircularProgressIndicator()),
        ),
      );

      expect(find.byType(NeonCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('widget properties are correctly set', (tester) async {
      const color = Colors.green;
      const strokeWidth = 6.0;
      const radius = 32.0;
      const blurSigma = 10.0;
      const value = 0.75;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NeonCircularProgressIndicator(
              color: color,
              strokeWidth: strokeWidth,
              radius: radius,
              blurSigma: blurSigma,
              value: value,
            ),
          ),
        ),
      );

      final widget = tester.widget<NeonCircularProgressIndicator>(
        find.byType(NeonCircularProgressIndicator),
      );

      expect(widget.color, color);
      expect(widget.strokeWidth, strokeWidth);
      expect(widget.radius, radius);
      expect(widget.blurSigma, blurSigma);
      expect(widget.value, value);
    });
  });

  group('NeonCircularProgressIndicatorTheme', () {
    test('copyWith returns correct values', () {
      const theme = NeonCircularProgressIndicatorTheme(
        strokeWidth: 4.0,
        radius: 20.0,
        blurSigma: 5.0,
      );

      final copied =
          theme.copyWith(strokeWidth: 8.0)
              as NeonCircularProgressIndicatorTheme;

      expect(copied.strokeWidth, 8.0);
      expect(copied.radius, 20.0);
      expect(copied.blurSigma, 5.0);
    });

    test('lerp returns correct values', () {
      const theme1 = NeonCircularProgressIndicatorTheme(
        strokeWidth: 4.0,
        blurSigma: 4.0,
      );
      const theme2 = NeonCircularProgressIndicatorTheme(
        strokeWidth: 8.0,
        blurSigma: 8.0,
      );

      final lerped =
          theme1.lerp(theme2, 0.5) as NeonCircularProgressIndicatorTheme;

      expect(lerped.strokeWidth, 6.0);
      expect(lerped.blurSigma, 6.0);
    });

    test('default values are correct', () {
      const theme = NeonCircularProgressIndicatorTheme();

      expect(theme.strokeWidth, 4.0);
      expect(theme.radius, null);
      expect(theme.backgroundColor, null);
      expect(theme.blurSigma, 4.0);
    });
  });
}
