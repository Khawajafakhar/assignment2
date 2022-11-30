import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../consts/app_colors_strings.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key, this.txt, this.txt2,this.onPressed});
  final String? txt;
  final String? txt2;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(text: txt, children: [
      TextSpan(
          text: txt2,
          recognizer: TapGestureRecognizer()
            ..onTap =
                onPressed,
          style: const TextStyle(
            color: AppColors.richTextBtnColor,
            decoration: TextDecoration.underline,
          ))
    ]));
  }
}
