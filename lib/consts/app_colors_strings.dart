import 'package:flutter/material.dart';

class AppColors {
  static const backGroundColor = Color(0xFF111820);
  static const txtColorWhite = Color(0xFFF0F1F1);
  static const activeDotColor = Color(0xFFFFC56E);
  static const inActiveDotColor = Color(0xFF888B8F);
  static const textFieldColor = Color(0xFF1B1F2A);
  static const colorWhite = Color(0xFFF0F1F1);
  static const richTextBtnColor = Color(0xFF71DBD4);
  static const indicatorColor = Color(0xFFF8485E);
  static const colorpinkish = Color(0xFFF8485E);
  static const colorReddidh = Color(0xFFF8495E);

  static const pinkishGradient = LinearGradient(
    colors: [
      Color(0xFFF67599),
      Color(0xFFE31C79),
      Color(0xFF8F2291),
      Color(0xFF5F259F),
    ],
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
  );
  static const yellowishGradient = LinearGradient(colors: [
    Color(0xFFFFC56E),
    Color(0xFFFFB36E),
    Color(0xFFFF8D6D),
    Color(0xFFF8485E),
  ]);
  static const blackishGradient = LinearGradient(
      colors: [Color(0xFF28314A), Color(0xFF1B1F2A), Color(0XFF1B1F2A)],
      end: Alignment.bottomLeft,
      tileMode: TileMode.mirror);
  static const yellowishGradient2 = LinearGradient(colors: [
    Color(0xFFFFE7C3),
    Color(0xFFFFB36E),
    Color(0xFFF8485E),
    Color(0xFFFF0726),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}
