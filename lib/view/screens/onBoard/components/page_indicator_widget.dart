import 'package:assigment2/res/consts/app_colors_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class PageIndicatorWidget extends StatelessWidget {
  PageIndicatorWidget({super.key, required this.controller});
  PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: const SwapEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: AppColors.activeDotColor,
            dotColor: AppColors.inActiveDotColor),
      ),
    );
  }
}
