import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../consts/app_colors_strings.dart';
import '../../signup/sign_up_screen.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key, this.txt, this.txt2});
  final String? txt;
  final String? txt2;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(text: txt, children: [
      TextSpan(
          text: txt2,
          recognizer: TapGestureRecognizer()
            ..onTap =
                () => Navigator.of(context).pushNamed(SignUpScreen.routename),
          style: const TextStyle(
            color: AppColors.richTextBtnColor,
            decoration: TextDecoration.underline,
          ))
    ]));
  }
}
