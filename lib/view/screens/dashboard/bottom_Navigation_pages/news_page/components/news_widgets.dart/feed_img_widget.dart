import 'package:flutter/material.dart';
import '../../../../../../../consts/app_colors_strings.dart';
import '../../../../../../../consts/app_img_strings.dart';

class FeedImgWidget extends StatelessWidget {
  const FeedImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
          gradient: AppColors.yellowishGradient2, shape: BoxShape.circle),
      child: Center(
          child: Container(
        height: 35,
        width: 35,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.backGroundColor),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              AppImages.imgProfile,
              fit: BoxFit.cover,
            )),
      )),
    );
  }
}
