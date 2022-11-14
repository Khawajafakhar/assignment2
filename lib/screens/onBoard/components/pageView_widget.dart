import 'package:assigment2/consts/app_img_strings.dart';
import 'package:flutter/material.dart';
import './onBoard_widget.dart';

class PageViewWidget extends StatelessWidget {
  PageViewWidget({super.key, required this.controller});
  PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        OnBoardWidget(
          image: AppImages.onBoard1,
        ),
        OnBoardWidget(image: AppImages.onBoard2),
        OnBoardWidget(image: AppImages.onBoard3)
      ],
    );
  }
}
