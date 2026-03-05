import 'package:flutter/material.dart';
import 'package:neon_ui/neon_ui.dart';

/// {@template neon_button}
/// A neon styled button widget.
/// {@endtemplate}
enum NeonButtonType {
  /// A primary neon button.
  primary,

  /// A secondary neon button.
  secondary,
}

/// {@template neon_button}
/// A neon styled button widget.
/// {@endtemplate}
class NeonButton extends StatelessWidget {
  /// {@macro neon_button}
  const NeonButton({
    required this.child,
    this.type = NeonButtonType.primary,
    this.onPressed,
    this.onPressedDown,
    this.onPressedUp,
    this.maxWidth = 200,
    this.maxHeight,
    super.key,
  });

  /// The child widget to be displayed inside the button.
  final Widget child;

  /// The type of the neon button.
  final NeonButtonType type;

  /// The callback to be invoked when the button is pressed.
  final VoidCallback? onPressed;

  /// The callback to be invoked when the button is pressed down.
  final VoidCallback? onPressedDown;

  /// The callback to be invoked when the button is released.
  final VoidCallback? onPressedUp;

  /// The maximum width of the button.
  final double? maxWidth;

  /// The maximum height of the button.
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    final neonButtonTheme = Theme.of(context).extension<NeonButtonTheme>();
    final colorScheme = Theme.of(context).colorScheme;
    final primaryColor = colorScheme.primary;
    final secondaryColor = colorScheme.inversePrimary;

    final backgroundColor = type == NeonButtonType.primary
        ? primaryColor.withValues(alpha: .25)
        : secondaryColor.withValues(alpha: .25);

    return NeonPressable(
      onPressed: onPressed,
      onPressedDown: onPressedDown,
      onPressedUp: onPressedUp,
      child: NeonDecoratedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              neonButtonTheme?.borderRadius ?? 8.0,
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: neonButtonTheme?.minHeight ?? 48.0,
              maxHeight:
                  maxHeight ?? neonButtonTheme?.maxHeight ?? double.infinity,
              maxWidth: maxWidth ?? double.infinity,
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
