import 'package:flutter/material.dart';
import '../../consts/app_colors_strings.dart';
import 'components/profile_img.dart';
import '../../consts/ui_helper.dart';
import '../../widgets/text_widget.dart';
import './components/list_tile_widget.dart';
import '../../consts/app_img_strings.dart';
import '../../consts/app_text_strings.dart';
import '../gradients/icon_label_gradient.dart';
import '../../consts/app_widgets.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(gradient: AppColors.blackishGradient),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UiHelper.verticalSmall,
              const ProfileImgWidget(),
              UiHelper.verticalXSmall,
              const TextWidget(
                txt: 'Johne Aly',
                color: AppColors.colorWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              UiHelper.verticalXSmall,
              const TextWidget(
                txt: '@Johne39',
                color: AppColors.colorWhite,
                fontSize: 18,
              ),
              UiHelper.verticalSmall,
              SizedBox(
                height: 350,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) => DrawerListTileWidget(
                    leading: AppImages.drawerImgList[index],
                    title: AppWidgets.drawertxtList[index],
                  ),
                ),
              ),
              UiHelper.verticalSmall,
             const SizedBox(
                width: double.infinity,
                child:  GradientIcon(
                  isRow: true,
                  icon: Icons.logout,
                  txt: AppStrings.logOutTxt,
                  gradient: AppColors.yellowishGradient2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
