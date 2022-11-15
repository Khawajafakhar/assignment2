import 'package:flutter/material.dart';
import '../consts/app_img_strings.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                width: double.infinity,
                height: 100,
                child: Image.asset(AppImages.imgLogo),
              );
  }
}