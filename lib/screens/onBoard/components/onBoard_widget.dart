import 'package:assigment2/consts/app_text_strings.dart';
import 'package:flutter/cupertino.dart';
import '../../../consts/app_colors_strings.dart';
import '../../../widgets/text_widget.dart';
import '../../../consts/ui_helper.dart';

class OnBoardWidget extends StatelessWidget {
 const OnBoardWidget({super.key, required this.image});
 final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: ClipRRect(
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                image!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: TextWidget(
                      textAlign: TextAlign.center,
                      txt: AppStrings.onBoardTxt2,
                      fontSize: 16,
                      color: AppColors.txtColorWhite,
                    ),
                  )
                ]),
          ),
        )
      ],
    );
  }
}
