import 'package:assigment2/widgets/gradients/text_gradient.dart';
import 'package:flutter/material.dart';
import '../../../../../../widgets/text_widget.dart';
import '../../../../../../consts/app_colors_strings.dart';
import '../../../../../../consts/app_text_strings.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget({super.key, required this.selectedIndex, required this.index});
  ValueChanged<int> selectedIndex;
  int index;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => InkWell(
          onTap: () => selectedIndex(index),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 80,
            width: size.width*0.33,
            decoration: BoxDecoration(
                border: index == this.index
                    ? const Border(
                        bottom:
                            BorderSide(width: 2, color: AppColors.colorReddidh))
                    : null,gradient: AppColors.blackishGradient),
            child: Center(
                child: index == this.index
                    ? GradientText(
                        txt: AppStrings.tabBarItems[index],
                        gradient: AppColors.yellowishGradient2,
                      )
                    : TextWidget(
                        txt: AppStrings.tabBarItems[index],
                        color: AppColors.colorWhite,
                        fontSize: 16,
                        
                      )),
          ),
        ),
      ),
    );
  }
}
