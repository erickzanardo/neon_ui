import 'package:flutter/material.dart';
import 'package:neon_ui/neon_ui.dart';

/// {@template neon_icon}
/// A widget that displays a neon-styled icon.
/// {@endtemplate}
class NeonIcon extends StatelessWidget {
  /// {@macro neon_icon}
  const NeonIcon({
    required this.icon,
    this.color,
    this.size,
    this.padding,
    super.key,
  }) : _undecorated = false;

  /// Creates a neon-styled icon without decoration.
  const NeonIcon.undecorated({
    required this.icon,
    this.color,
    this.size,
    this.padding,
    super.key,
  }) : _undecorated = true;

  /// The icon data to be displayed.
  final IconData icon;

  /// The color of the neon icon. Overrides the theme color if provided.
  final Color? color;

  /// The size of the neon icon. Overrides the theme size if provided.
  final double? size;

  /// The padding around the neon icon. Overrides the theme padding if provided.
  final double? padding;

  final bool _undecorated;

  @override
  Widget build(BuildContext context) {
    final neonIconTheme = Theme.of(context).extension<NeonIconTheme>();
    final effectiveSize = size ?? neonIconTheme?.size ?? 24.0;
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;
    final effectivePadding = padding ?? neonIconTheme?.padding ?? 8.0;

    if (_undecorated) {
      return Padding(
        padding: EdgeInsets.all(effectivePadding),
        child: Icon(
          icon,
          color: effectiveColor,
          size: effectiveSize,
        ),
      );
    }

    return NeonDecoratedBox(
      child: Padding(
        padding: EdgeInsets.all(effectivePadding),
        child: Icon(
          icon,
          color: effectiveColor,
          size: effectiveSize,
        ),
      ),
    );
  }
}

/// {@template neon_icon_button}
/// A button that displays a neon-styled icon.
/// {@endtemplate}
class NeonIconButton extends StatelessWidget {
  /// {@macro neon_icon_button}
  const NeonIconButton({
    required this.icon,
    this.onPressed,
    this.color,
    this.size,
    this.padding,
    super.key,
  }) : _undecorated = false;

  /// Creates a neon-styled icon button without decoration.
  const NeonIconButton.undecorated({
    required this.icon,
    this.onPressed,
    this.color,
    this.size,
    this.padding,
    super.key,
  }) : _undecorated = true;

  /// The icon data to be displayed.
  final IconData icon;

  /// The callback to be invoked when the button is pressed.
  final VoidCallback? onPressed;

  /// The color of the neon icon. Overrides the theme color if provided.
  final Color? color;

  /// The size of the neon icon. Overrides the theme size if provided.
  final double? size;

  /// The padding around the neon icon. Overrides the theme padding if provided.
  final double? padding;

  final bool _undecorated;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed != null ? 1.0 : 0.5,
      child: MouseRegion(
        cursor: onPressed != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: onPressed,
          child: _undecorated
              ? NeonIcon.undecorated(
                  icon: icon,
                  color: color,
                  size: size,
                  padding: padding,
                )
              : NeonIcon(
                  icon: icon,
                  color: color,
                  size: size,
                  padding: padding,
                ),
        ),
      ),
    );
  }
}
