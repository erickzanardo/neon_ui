import 'package:flutter/material.dart';
import 'package:neon_ui/src/widgets/neon_decoration.dart';

/// {@template neon_checkbox}
/// A checkbox widget with neon styling.
/// {@endtemplate}
class NeonCheckbox extends StatelessWidget {
  /// {@macro neon_checkbox}
  const NeonCheckbox({
    required this.value,
    this.onChanged,
    super.key,
  });

  /// Whether this checkbox is checked.
  final bool value;

  /// Called when the value of the checkbox changes.
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final disabled = onChanged == null;
    return Opacity(
      opacity: disabled ? 0.5 : 1.0,
      child: MouseRegion(
        cursor: disabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onChanged?.call(!value),
          child: NeonDecoratedBox(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SizedBox.square(
                dimension: 24,
                child: value
                    ? Icon(Icons.check, color: primaryColor)
                    : const SizedBox(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
