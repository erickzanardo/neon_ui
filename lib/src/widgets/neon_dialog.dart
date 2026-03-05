import 'package:flutter/material.dart';
import 'package:neon_ui/neon_ui.dart';

/// {@template neon_dialog}
/// A dialog widget with neon styling.
/// {@endtemplate}
class NeonDialog extends StatelessWidget {
  /// {@macro neon_dialog}
  const NeonDialog({
    required this.width,
    required this.height,
    required this.child,
    super.key,
  });

  /// The child widget to be displayed inside the dialog.
  final Widget child;

  /// The width of the dialog.
  final double width;

  /// The height of the dialog.
  final double height;

  /// Displays a neon-styled dialog.
  ///
  /// When [width] and [height] are not provided, the dialog
  /// will use 80% and 60% of the screen size respectively.
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    double? width,
    double? height,
  }) {
    final effectiveWidth = width ?? MediaQuery.of(context).size.width * 0.8;
    final effectiveHeight = height ?? MediaQuery.of(context).size.height * 0.6;
    return showDialog<T>(
      context: context,
      builder: (context) => NeonDialog(
        width: effectiveWidth,
        height: effectiveHeight,
        child: builder(context),
      ),
    );
  }

  /// Displays a confirmation dialog with [content] and
  /// "Yes" and "Cancel" buttons.
  static Future<bool?> showConfirm(
    BuildContext context, {
    required String content,
    String confirmText = 'Yes',
    String cancelText = 'Cancel',
    double? width,
    double? height,
  }) {
    return NeonDialog.show<bool>(
      context: context,
      width: width,
      height: height,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(content),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                NeonButton(
                  type: NeonButtonType.secondary,
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(cancelText),
                ),
                NeonButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(confirmText),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: NeonContainer(
            width: width,
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}
