import 'package:flutter/material.dart';
import 'package:neon_ui/neon_ui.dart';

/// {@template neon_decorated_box}
/// A container that applies neon decoration to its child.
/// {@endtemplate}
class NeonDecoratedBox extends StatelessWidget {
  /// {@macro neon_decorated_box}
  const NeonDecoratedBox({
    required this.child,
    this.color,
    this.borderRadius,
    this.borderWidth,
    this.offset,
    this.blurSigma,
    super.key,
  });

  /// The child widget to be decorated.
  final Widget child;

  /// The neon color to be applied.
  final Color? color;

  /// The border radius of the neon decoration.
  final double? borderRadius;

  /// The border width of the neon decoration.
  final double? borderWidth;

  /// The offset of the neon shadow.
  final double? offset;

  /// The blur sigma of the neon shadow.
  final double? blurSigma;

  @override
  Widget build(BuildContext context) {
    final config = Theme.of(context).extension<NeonDecorationConfig>();
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;
    final effectiveBorderRadius = borderRadius ?? config?.borderRadius ?? 8;
    final effectiveBorderWidth = borderWidth ?? config?.borderWidth ?? 1;
    final effectiveOffset = offset ?? config?.offset ?? 2;
    final effectiveBlurSigma = blurSigma ?? config?.blurSigma ?? 4;
    return CustomPaint(
      painter: _NeonPainter(
        color: effectiveColor,
        borderRadius: effectiveBorderRadius,
        borderWidth: effectiveBorderWidth,
        offset: effectiveOffset,
        blurSigma: effectiveBlurSigma,
      ),
      child: child,
    );
  }
}

class _NeonPainter extends CustomPainter {
  _NeonPainter({
    required this.color,
    required this.borderRadius,
    required this.borderWidth,
    required this.offset,
    required this.blurSigma,
  });

  final Color color;
  final double borderRadius;
  final double borderWidth;
  final double offset;
  final double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    final rrectBorder = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );

    final borderPaint = Paint()
      ..strokeWidth = borderWidth
      ..color = color
      ..style = PaintingStyle.stroke;

    final offsets = [
      Offset(0, offset),
      Offset(0, -offset),
      Offset(offset, 0),
      Offset(-offset, 0),
    ];
    for (final offset in offsets) {
      final shadowPaint = Paint()
        ..strokeWidth = borderWidth
        ..color = color
        ..style = PaintingStyle.stroke
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
      final rrectShadow = RRect.fromRectAndRadius(
        offset & size,
        Radius.circular(borderRadius),
      );
      canvas.drawRRect(rrectShadow, shadowPaint);
    }
    canvas.drawRRect(rrectBorder, borderPaint);
  }

  @override
  bool shouldRepaint(_NeonPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.borderWidth != borderWidth;
  }
}
