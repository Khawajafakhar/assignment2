import 'package:flutter/material.dart';
import '../consts/app_colors_strings.dart';
import '../components/text_widget.dart';
import '../consts/app_text_strings.dart';
import 'gradients/icon_label_gradient.dart';

class BottomAppBarWidget extends StatelessWidget {
  BottomAppBarWidget({super.key, this.index = 0,required this.value});
  int index;
  ValueChanged<int> value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(color: AppColors.backGroundColor),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        getBottomBarItem(
            icon: Icons.home_outlined,
            index: 0,
            label: AppStrings.homeTxt),
        getBottomBarItem(
            icon: Icons.toc_outlined,
            index: 1,
            label: AppStrings.fixtureTxt),
        getBottomBarItem(
            icon: Icons.stacked_bar_chart,
            index: 2,
            label: AppStrings.leaderTxt),
        getBottomBarItem(
            icon: Icons.newspaper,
            index: 3,
            label: AppStrings.newsTxt),
        getBottomBarItem(
            icon:  Icons.settings_outlined,
            index: 4,
            label: AppStrings.settingsTxt),
      ]),
    );
  }

  Widget getBottomBarItem({required icon, required label, required index}) {
    final isSelected = index == this.index;
    return InkWell(
      onTap: () => value(index),
      child: SizedBox(
        height: 50,
        width: 60,
        child: isSelected
            ? GradientIcon(
                gradient: AppColors.yellowishGradient,
                icon: icon,
                txt: label,
              )
            : Column(
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: AppColors.colorWhite,
                  ),
                  TextWidget(
                    txt: label,
                    color: AppColors.colorWhite,
                    fontSize: 12,
                  )
                ],
              ),
      ),
    );
  }
}
