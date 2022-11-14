import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    Key? key,
    this.txt,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);
  String? txt;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt!,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        
      ),
    );
  }
}
