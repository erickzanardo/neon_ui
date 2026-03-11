import 'package:flutter/material.dart';
import 'package:neon_ui/src/widgets/neon_decoration.dart';
import 'package:neon_ui/src/widgets/neon_pressable.dart';

/// {@template neon_chip}
/// A chip widget with neon styling and a mild glow effect.
/// {@endtemplate}
class NeonChip extends StatelessWidget {
  /// {@macro neon_chip}
  const NeonChip({
    required this.label,
    this.avatar,
    this.onDeleted,
    this.onPressed,
    this.selected = false,
    super.key,
  });

  /// The label text of the chip.
  final String label;

  /// The avatar widget displayed at the start of the chip.
  final Widget? avatar;

  /// Callback when the chip is deleted.
  final VoidCallback? onDeleted;

  /// Callback when the chip is pressed.
  final VoidCallback? onPressed;

  /// Whether the chip is selected.
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final primaryColor = colorScheme.primary;
    final disabled = onPressed == null && onDeleted == null;

    final backgroundColor = selected
        ? primaryColor.withValues(alpha: .25)
        : primaryColor.withValues(alpha: .1);

    Widget chipContent = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (avatar != null) ...[avatar!, const SizedBox(width: 8)],
        Text(
          label,
          style: TextStyle(
            color: primaryColor,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (onDeleted != null) ...[
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onDeleted,
            child: Icon(Icons.close, size: 18, color: primaryColor),
          ),
        ],
      ],
    );

    chipContent = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: chipContent,
    );

    if (onPressed != null || onDeleted != null) {
      chipContent = NeonPressable(onPressed: onPressed, child: chipContent);
    }

    return Opacity(
      opacity: disabled ? 0.5 : 1.0,
      child: NeonDecoratedBox(
        color: primaryColor,
        borderRadius: 16,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: chipContent,
        ),
      ),
    );
  }
}
