import 'package:flutter/material.dart';
import '../text_widget.dart';
import '../../consts/app_colors_strings.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon(
      {super.key,
      this.icon,
      this.size = 30,
      this.gradient = AppColors.pinkishGradient,
      this.txt,
      this.isRow = false});

  final IconData? icon;
  final double size;
  final Gradient gradient;
  final String? txt;
  final bool isRow;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.3,
        height: size * 1.3,
        child: isRow
            ? Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      size: size,
                      color: AppColors.colorWhite,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: TextWidget(
                        txt: txt,
                        fontSize: 18,
                        color: AppColors.colorWhite,
                      ),
                    ),
                  ],
                ),
            )
            : Column(
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
