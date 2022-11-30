import 'package:assigment2/res/consts/app_colors_strings.dart';
import 'package:assigment2/res/consts/app_text_strings.dart';
import 'package:assigment2/view/screens/onBoard/components/pageview_widget.dart';
import 'package:flutter/material.dart';
import '../onBoard/components/page_indicator_widget.dart';
import '../../../res/components/buttons/elevated_button_widget.dart';
import '../../../utils/routes/routes_name.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  PageController controller = PageController();
  BuildContext? ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backGroundColor,
        body: ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: double.infinity, maxHeight: double.infinity),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.75,
                child: PageViewWidget(controller: controller),
              ),
              Expanded(
                child: PageIndicatorWidget(controller: controller),
              ),
              Expanded(
                child: Center(
                  child: ButtonWidget(
                    height: size.height * 0.05,
                    width: 220,
                    txt: AppStrings.btnTxtGetStarted,
                    onPressed: getStartedButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getStartedButton() {
    Navigator.pushNamed(ctx!,RoutesName.login);
  }
}
