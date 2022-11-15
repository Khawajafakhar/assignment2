import 'package:flutter/material.dart';

class Gradientwidget extends StatelessWidget {
  Gradientwidget({
    this.gradient = const LinearGradient(colors: [
      Color(0xFFFFC56E),
      Color(0xFFFFB36E),
      Color(0xFFFF8D6D),
      Color(0xFFF8485E),
    ]),
    this.child,
  });
  final Gradient gradient;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcOver,
      shaderCallback: (bounds) => gradient
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: child,
    );
  }
}
