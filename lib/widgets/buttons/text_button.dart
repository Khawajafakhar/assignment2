import 'package:assigment2/consts/app_colors_strings.dart';
import 'package:assigment2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../../consts/app_text_strings.dart';

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
