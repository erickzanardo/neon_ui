import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neon_ui/neon_ui.dart';

/// {@template neon_circular_progress_indicator}
/// A widget that displays a circular progress indicator with neon glow effect.
/// {@endtemplate}
class NeonCircularProgressIndicator extends StatefulWidget {
  /// {@macro neon_circular_progress_indicator}
  const NeonCircularProgressIndicator({
    super.key,
    this.color,
    this.strokeWidth,
    this.radius,
    this.backgroundColor,
    this.value,
    this.blurSigma,
    this.duration,
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
  /// If null, the indicator shows an endless animation.
  final double? value;

  /// The blur sigma of the neon glow.
  final double? blurSigma;

  /// The duration of the endless animation.
  final Duration? duration;

  Duration get _effectiveDuration => duration ?? const Duration(seconds: 2);

  @override
  State<NeonCircularProgressIndicator> createState() =>
      _NeonCircularProgressIndicatorState();
}

class _NeonCircularProgressIndicatorState
    extends State<NeonCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget._effectiveDuration,
    );

    if (widget.value == null) {
      unawaited(_controller.repeat());
    }
  }

  @override
  void didUpdateWidget(NeonCircularProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_controller.isAnimating) {
      unawaited(_controller.repeat());
    } else if (widget.value != null && _controller.isAnimating) {
      _controller
        ..stop()
        ..value = widget.value!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(
      context,
    ).extension<NeonCircularProgressIndicatorTheme>();
    final effectiveColor =
        widget.color ?? theme?.color ?? Theme.of(context).colorScheme.primary;
    final effectiveStrokeWidth =
        widget.strokeWidth ?? theme?.strokeWidth ?? 4.0;
    final effectiveRadius = widget.radius ?? theme?.radius;
    final effectiveBackgroundColor =
        widget.backgroundColor ?? theme?.backgroundColor;
    final effectiveBlurSigma = widget.blurSigma ?? theme?.blurSigma ?? 4.0;

    return SizedBox(
      width: effectiveRadius != null ? effectiveRadius * 2 : null,
      height: effectiveRadius != null ? effectiveRadius * 2 : null,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _NeonCircularProgressPainter(
              color: effectiveColor,
              strokeWidth: effectiveStrokeWidth,
              backgroundColor: effectiveBackgroundColor,
              value: widget.value ?? _controller.value,
              blurSigma: effectiveBlurSigma,
            ),
          );
        },
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
      ..color = color.withValues(alpha: .8)
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
      final sweepAngle = 2 * pi * value!;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: effectiveRadius),
        -pi / 2,
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
