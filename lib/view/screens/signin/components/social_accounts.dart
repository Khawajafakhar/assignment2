import 'package:assigment2/res/consts/app_colors_strings.dart';
import 'package:assigment2/res/consts/app_text_strings.dart';
import 'package:assigment2/res/components/text_widget.dart';
import 'package:flutter/material.dart';
import '../../../../res/consts/app_img_strings.dart';

class SocialAccountWidget extends StatelessWidget {
  const SocialAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextWidget(
            txt: AppStrings.socialAccTxt,
            textAlign: TextAlign.center,
            color: AppColors.colorWhite,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(AppImages.imgIconApple)),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(AppImages.imgIconFB)),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(AppImages.imgIconTwitter),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
