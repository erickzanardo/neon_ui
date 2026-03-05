import 'package:flutter/material.dart';

/// {@template neon_pressable}
/// A widget that provides neon pressable effects.
/// {@endtemplate}
class NeonPressable extends StatefulWidget {
  /// {@macro neon_pressable}
  const NeonPressable({
    required this.child,
    this.onPressed,
    this.onPressedDown,
    this.onPressedUp,
    super.key,
  });

  /// The child widget to display inside the pressable area.
  final Widget child;

  /// Callback when the pressable area is pressed.
  final VoidCallback? onPressed;

  /// Callback when the pressable area is pressed down.
  final VoidCallback? onPressedDown;

  /// Callback when the pressable area is released.
  final VoidCallback? onPressedUp;

  @override
  State<NeonPressable> createState() => _NeonPressableState();
}

class _NeonPressableState extends State<NeonPressable> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final enabled =
        widget.onPressed != null ||
        widget.onPressedDown != null ||
        widget.onPressedUp != null;

    return Opacity(
      opacity: enabled ? (_pressed ? 0.5 : 1.0) : 0.5,
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: (_) {
          setState(() {
            _pressed = true;
          });
          widget.onPressedDown?.call();
        },
        onTapUp: (_) {
          setState(() {
            _pressed = false;
          });
          widget.onPressedUp?.call();
        },
        onTapCancel: () {
          setState(() {
            _pressed = false;
          });
          widget.onPressedUp?.call();
        },
        child: MouseRegion(
          cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: widget.child,
        ),
      ),
    );
  }
}
