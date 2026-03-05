import 'package:flutter/material.dart';
import 'package:neon_ui/neon_ui.dart';

/// {@template neon_divider}
/// A divider widget with neon styling.
/// {@endtemplate}
class NeonDivider extends StatelessWidget {
  /// {@macro neon_divider}
  const NeonDivider({
    this.color,
    this.thickness,
    this.indent,
    this.endIndent,
    super.key,
  });

  /// The color of the neon divider.
  final Color? color;

  /// The thickness of the divider line.
  final double? thickness;

  /// The amount of empty space to the leading edge of the divider.
  final double? indent;

  /// The amount of empty space to the trailing edge of the divider.
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    final config = Theme.of(context).extension<NeonDecorationConfig>();
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;
    final effectiveThickness = thickness ?? config?.borderWidth ?? 1.0;
    final effectiveBlurSigma = config?.blurSigma ?? 4.0;
    final effectiveOffset = config?.offset ?? 2.0;

    return CustomPaint(
      painter: _NeonDividerPainter(
        color: effectiveColor,
        thickness: effectiveThickness,
        blurSigma: effectiveBlurSigma,
        offset: effectiveOffset,
        indent: indent ?? 0.0,
        endIndent: endIndent ?? 0.0,
      ),
      child: Divider(
        color: effectiveColor,
        thickness: effectiveThickness,
        indent: indent,
        endIndent: endIndent,
        height: effectiveThickness + 8,
      ),
    );
  }
}

class _NeonDividerPainter extends CustomPainter {
  _NeonDividerPainter({
    required this.color,
    required this.thickness,
    required this.blurSigma,
    required this.offset,
    required this.indent,
    required this.endIndent,
  });

  final Color color;
  final double thickness;
  final double blurSigma;
  final double offset;
  final double indent;
  final double endIndent;

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height / 2;
    final start = Offset(indent, y);
    final end = Offset(size.width - endIndent, y);

    // Draw neon shadow
    final offsets = [
      Offset(0, offset),
      Offset(0, -offset),
      Offset(offset, 0),
      Offset(-offset, 0),
    ];
    for (final o in offsets) {
      final shadowPaint = Paint()
        ..color = color
        ..strokeWidth = thickness
        ..style = PaintingStyle.stroke
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
      canvas.drawLine(start + o, end + o, shadowPaint);
    }

    // Draw main line
    final linePaint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;
    canvas.drawLine(start, end, linePaint);
  }

  @override
  bool shouldRepaint(_NeonDividerPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.thickness != thickness ||
        oldDelegate.blurSigma != blurSigma ||
        oldDelegate.offset != offset ||
        oldDelegate.indent != indent ||
        oldDelegate.endIndent != endIndent;
  }
}
