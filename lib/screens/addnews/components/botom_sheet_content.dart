import 'package:flutter/material.dart';
import '../../../consts/app_colors_strings.dart';
import '../../../consts/ui_helper.dart';
import '../../../consts/app_widgets.dart';
import './list_tile_widget.dart';
import './check_box_widget.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height*0.5,
      width: double.infinity,
      color: AppColors.backGroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                width: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.colorWhite),
                  ),
                ),
              ),
            ),
            UiHelper.verticalSmall1,
            Expanded(
                child: ListView.builder(
              itemCount: AppWidgets.avatar.length,
              itemBuilder: (context, index) => ListTileWidget(
                leading: AppWidgets.avatar[index],
                title: AppWidgets.titleList[index],
                subTitle: AppWidgets.subTitleList[index],
                trailing: const CheckBoxWidget(),
                
              ),
            ))
          ],
        ),
      ),
    );
  }
}
