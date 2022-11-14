import 'package:assigment2/consts/app_colors_strings.dart';
import 'package:assigment2/consts/app_text_strings.dart';
import 'package:assigment2/consts/ui_helper.dart';
import 'package:assigment2/screens/onBoard/components/pageView_widget.dart';
import 'package:flutter/material.dart';
import '../onBoard/components/page_indicator_widget.dart';
import '../../widgets/button_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex:8,child: PageViewWidget(controller: controller)),
          Expanded(child: PageIndicatorWidget(controller: controller)),
          Expanded(child: ButtonWidget(height: 40,width: 220,txt: AppStrings.btnTxtGetStarted,)),
        ],
      ),
    );
  }
}
