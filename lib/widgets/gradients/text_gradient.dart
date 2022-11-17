import 'package:flutter/material.dart';
import '../text_widget.dart';
import '../../consts/app_colors_strings.dart';

class GradientText extends StatelessWidget {
  const GradientText(
      {super.key,
      this.size = 70,
      this.gradient = AppColors.pinkishGradient,
      this.txt,
      this.isRow = false});

  final double size;
  final Gradient gradient;
  final String? txt;
  final bool isRow;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
              child: TextWidget(
            txt: txt,
            color: AppColors.colorWhite,
            textAlign: TextAlign.center,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ))),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, bounds.width, bounds.height);
        return gradient.createShader(rect);
      },
    );
  }
}
