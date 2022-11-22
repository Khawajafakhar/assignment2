import 'package:flutter/material.dart';
import '../consts/app_colors_strings.dart';
import '../consts/app_img_strings.dart';
import 'text_widget.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Center(child: TextWidget(txt: 'LOADING...!!',)),
    );
  }
}
//Image.asset(AppImages.imgLogo,fit: BoxFit.contain,),