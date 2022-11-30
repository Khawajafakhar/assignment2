import 'package:assigment2/res/consts/app_colors_strings.dart';
import '../text_widget.dart';
import 'package:flutter/material.dart';

class TextButtonwidget extends StatelessWidget {
  const TextButtonwidget({
    super.key,
    this.onPressed,
    this.txt,
    this.align,
  });
  final void Function()? onPressed;
  final String? txt;
  final AlignmentGeometry? align;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: align,
      child: TextButton(
        onPressed: onPressed,
        child: TextWidget(
          textAlign: TextAlign.center,
          txt: txt,
          color: AppColors.colorWhite,
        ),
      ),
    );
  }
}