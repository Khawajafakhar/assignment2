import 'package:flutter/material.dart';
import '../widgets/text_widget.dart';
import '../consts/app_colors_strings.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon(
      {super.key,
      this.icon,
      this.size = 30,
      this.gradient = AppColors.pinkishGradient,
      this.txt});

  final IconData? icon;
  final double size;
  final Gradient gradient;
  final String? txt;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.3,
        height: size * 1.3,
        child: Column(
          children: [
            Icon(
              icon,
              size: size,
              color: AppColors.colorWhite,
            ),
            TextWidget(
              txt: txt,
              fontSize: 12,
              color: AppColors.colorWhite,
            ),
          ],
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, bounds.width, bounds.height);
        return gradient.createShader(rect);
      },
    );
  }
}
