import 'package:flutter/material.dart';
import 'package:neon_ui/src/widgets/neon_decoration.dart';

/// {@template neon_radio}
/// A radio button widget with neon styling.
/// {@endtemplate}
class NeonRadio extends StatelessWidget {
  /// {@macro neon_radio}
  const NeonRadio({required this.value, this.onChanged, super.key});

  /// Whether this radio button is selected.
  final bool value;

  /// Called when the value of the radio button changes.
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
                    ? Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
