import 'package:flutter/material.dart';
import 'package:neon_ui/neon_ui.dart';

/// {@template neon_circular_progress_indicator}
/// A widget that displays a circular progress indicator with neon glow effect.
/// {@endtemplate}
class NeonCircularProgressIndicator extends StatelessWidget {
  /// {@macro neon_circular_progress_indicator}
  const NeonCircularProgressIndicator({
    super.key,
    this.color,
    this.strokeWidth,
    this.radius,
    this.backgroundColor,
    this.value,
    this.blurSigma,
  });

  /// The color of the neon indicator. Overrides the theme color if provided.
  final Color? color;

  /// The width of the progress indicator stroke.
  final double? strokeWidth;

  /// The radius of the progress indicator.
  final double? radius;

  /// The background color of the progress indicator.
  final Color? backgroundColor;

  /// The value of the progress indicator (0.0 to 1.0).
  /// If null, the indicator is indeterminate.
  final double? value;

  /// The blur sigma of the neon glow.
  final double? blurSigma;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(
      context,
    ).extension<NeonCircularProgressIndicatorTheme>();
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;
    final effectiveStrokeWidth = strokeWidth ?? theme?.strokeWidth ?? 4.0;
    final effectiveRadius = radius ?? theme?.radius;
    final effectiveBackgroundColor = backgroundColor ?? theme?.backgroundColor;
    final effectiveBlurSigma = blurSigma ?? theme?.blurSigma ?? 4.0;

    return SizedBox(
      width: effectiveRadius != null ? effectiveRadius * 2 : null,
      height: effectiveRadius != null ? effectiveRadius * 2 : null,
      child: CustomPaint(
        painter: _NeonCircularProgressPainter(
          color: effectiveColor,
          strokeWidth: effectiveStrokeWidth,
          backgroundColor: effectiveBackgroundColor,
          value: value,
          blurSigma: effectiveBlurSigma,
        ),
      ),
    );
  }
}

class _NeonCircularProgressPainter extends CustomPainter {
  _NeonCircularProgressPainter({
    required this.color,
    required this.strokeWidth,
    required this.blurSigma,
    this.backgroundColor,
    this.value,
  });

  final Color color;
  final double strokeWidth;
  final Color? backgroundColor;
  final double? value;
  final double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final effectiveRadius = (size.width - strokeWidth) / 2;

    if (backgroundColor != null) {
      final backgroundPaint = Paint()
        ..strokeWidth = strokeWidth
        ..color = backgroundColor!
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      canvas.drawCircle(center, effectiveRadius, backgroundPaint);
    }

    final shadowPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);

    final progressPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (var i = 1; i <= 3; i++) {
      canvas.drawCircle(center, effectiveRadius, shadowPaint);
    }

    if (value != null) {
      final sweepAngle = 2 * 3.141592653589793 * value!;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: effectiveRadius),
        -3.141592653589793 / 2,
        sweepAngle,
        false,
        progressPaint,
      );
    } else {
      canvas.drawCircle(center, effectiveRadius, progressPaint);
    }
  }

  @override
  bool shouldRepaint(_NeonCircularProgressPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.value != value;
  }
}
