import 'package:flutter/material.dart';
import 'package:neon_ui/neon_ui.dart';

/// {@template neon_container}
/// A container widget with neon styling.
/// {@endtemplate}
class NeonContainer extends StatelessWidget {
  /// {@template neon_container}
  /// A container widget with neon styling.
  /// {@endtemplate}
  const NeonContainer({
    required this.child,
    this.padding,
    this.backgroundColor,
    this.height,
    this.width,
    super.key,
  });

  /// The child widget to be displayed inside the neon container.
  final Widget child;

  /// The padding inside the neon container. If null, defaults to theme value.
  final double? padding;

  /// The background color of the neon container. If null, defaults to theme
  /// value.
  final Color? backgroundColor;

  /// The width of the neon container.
  final double? width;

  /// The height of the neon container.
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<NeonContainerTheme>();
    final decoratedBoxConfig = Theme.of(
      context,
    ).extension<NeonDecorationConfig>();

    final effectiveBorderRadius = decoratedBoxConfig?.borderRadius ?? 8.0;

    final effectivePadding = padding ?? theme?.padding ?? 16.0;
    final effectiveBackgroundColor =
        backgroundColor ?? theme?.backgroundColor ?? Colors.black;

    return NeonDecoratedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: EdgeInsets.all(effectivePadding),
            child: child,
          ),
        ),
      ),
    );
  }
}
