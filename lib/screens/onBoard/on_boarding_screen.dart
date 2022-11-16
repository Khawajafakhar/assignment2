import 'package:assigment2/consts/app_colors_strings.dart';
import 'package:assigment2/consts/app_text_strings.dart';
import 'package:assigment2/screens/onBoard/components/pageview_widget.dart';
import 'package:flutter/material.dart';
import '../onBoard/components/page_indicator_widget.dart';
import '../../widgets/buttons/elevated_button_widget.dart';
import '../signin/sign_in_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  PageController controller = PageController();
 var ctx;
  @override
  Widget build(BuildContext context) {
    ctx=context;
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: size.height*0.8,child: PageViewWidget(controller: controller)),
          SizedBox(height: size.height*0.1,child: PageIndicatorWidget(controller: controller)),
          SizedBox(height: size.height*0.1,
            child: ButtonWidget(
              height: 40,
              width: 220,
              txt: AppStrings.btnTxtGetStarted,
              onPressed: getStartedButton,
            ),
          ),
        ],
      ),
    );
  }
  void getStartedButton(){
    Navigator.of(ctx).pushNamed(SignInScreen.routeName);
  }
}
