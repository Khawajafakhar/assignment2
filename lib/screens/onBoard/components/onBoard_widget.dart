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
    Size size=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height*0.65,
          child: Image.asset(
            image!,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: double.infinity,
          height: size.height*0.15,
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
