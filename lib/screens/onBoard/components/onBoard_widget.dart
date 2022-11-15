import 'package:assigment2/consts/app_text_strings.dart';
import 'package:flutter/cupertino.dart';
import '../../../consts/app_colors_strings.dart';
import '../../../widgets/text_widget.dart';
import '../../../consts/ui_helper.dart';

class OnBoardWidget extends StatelessWidget {
  OnBoardWidget({super.key, required this.image});
  String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image!,
          fit: BoxFit.cover,
        ),
        Container(
          width: 250,
          height: 120,
         // color: AppColors.activeDotColor,
          alignment: Alignment.topCenter,
         // decoration: const BoxDecoration(color: AppColors.activeDotColor),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:const [
                UiHelper.verticalXSmall,
                TextWidget(
                  textAlign: TextAlign.center,
                  txt: AppStrings.onBoardTxt1,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.txtColorWhite,
                ),
                UiHelper.verticalSmall,
                TextWidget(
                  textAlign: TextAlign.center,
                  txt: AppStrings.onBoardTxt2,
                  fontSize: 16,
                  color: AppColors.txtColorWhite,
                )
              ]),
        )
      ],
    );
  }
}
