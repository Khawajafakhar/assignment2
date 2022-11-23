import 'package:assigment2/consts/app_img_strings.dart';
import 'package:flutter/material.dart';
import 'onboard_widget.dart';

class PageViewWidget extends StatelessWidget {
 const PageViewWidget({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children:const [
        OnBoardWidget(
          image: AppImages.onBoard1,
        ),
        OnBoardWidget(image: AppImages.onBoard2),
        OnBoardWidget(image: AppImages.onBoard3)
      ],
    );
  }
}
