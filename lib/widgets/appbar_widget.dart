import 'package:flutter/material.dart';
import './text_widget.dart';
import '../consts/app_colors_strings.dart';
import '../consts/app_text_strings.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({super.key,this.txt});
  final String? txt;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
          elevation: 0,
          title: TextWidget(
            txt: txt,
            color: AppColors.colorWhite,
          ),
          centerTitle: true,
          backgroundColor: AppColors.backGroundColor,
        );
  }
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}