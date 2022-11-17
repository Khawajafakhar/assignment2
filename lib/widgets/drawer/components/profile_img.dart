import '../../../consts/app_colors_strings.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../consts/app_img_strings.dart';

class ProfileImgWidget extends StatelessWidget {
  const ProfileImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.colorYellow,
      dashPattern: const [8, 8],
      strokeWidth: 3,
      borderType: BorderType.Circle,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 150,
          width: 120,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(AppImages.imgProfile,fit: BoxFit.contain,),
        ),
      ),
    );
  }
}
