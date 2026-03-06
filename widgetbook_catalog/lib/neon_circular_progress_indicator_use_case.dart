import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:neon_ui/neon_ui.dart';

@widgetbook.UseCase(name: 'Default', type: NeonCircularProgressIndicator)
Widget buildNeonCircularProgressIndicatorUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeonCircularProgressIndicator(value: .5),
          NeonCircularProgressIndicator(color: Colors.blue),
          NeonCircularProgressIndicator(
            color: Colors.yellow,
            strokeWidth: 6,
            radius: 32,
          ),
          NeonCircularProgressIndicator(color: Colors.green, value: 0.7),
          NeonCircularProgressIndicator(
            color: Colors.purple,
            value: 0.5,
            backgroundColor: Colors.grey,
          ),
          const _AnimatedNeonCircularProgressIndicator(),
        ],
      ),
    ),
  );
}

class _AnimatedNeonCircularProgressIndicator extends StatefulWidget {
  const _AnimatedNeonCircularProgressIndicator();

  @override
  State<_AnimatedNeonCircularProgressIndicator> createState() =>
      _AnimatedNeonCircularProgressIndicatorState();
}

class _AnimatedNeonCircularProgressIndicatorState
    extends State<_AnimatedNeonCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return NeonCircularProgressIndicator(
          color: Colors.red,
          value: _controller.value,
        );
      },
    );
  }
}
