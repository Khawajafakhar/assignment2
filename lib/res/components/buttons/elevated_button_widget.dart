import 'package:assigment2/res/consts/app_colors_strings.dart';
import '../text_widget.dart';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    this.height,
    this.width,
    this.txt,
    this.onPressed,
    this.fontSize,
  });
  double? width;
  double? height;
  String? txt;
  void Function()? onPressed;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(colors: [
                  Color(0xFFF67599),
                  Color(0xFFE31C79),
                  Color(0xFF8F2291),
                  Color(0xFF5F259F),
                ])),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
                
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: onPressed,
              child: TextWidget(
                txt: txt,
                color: AppColors.txtColorWhite,
                fontSize: fontSize,
              ),
            )));
  }
}
