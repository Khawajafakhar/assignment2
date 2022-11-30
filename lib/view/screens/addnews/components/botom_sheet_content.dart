import 'package:flutter/material.dart';
import '../../../../res/consts/app_colors_strings.dart';
import '../../../../res/consts/ui_helper.dart';
import './list_tile_widget.dart';
import './check_box_widget.dart';
import '../../../../api/provider/selectmatch_provider.dart';
import 'package:provider/provider.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final matches= Provider.of<SelectMatchProvider>(context,listen: false);
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
              itemCount: matches.matchesList.length,
              itemBuilder: (context, index) { return ListTileWidget(
                leading: matches.matchesList[index].leagImg,
                title: matches.matchesList[index].leagTitle,
                subTitle: matches.matchesList[index].matchTitle,
                trailing:  CheckBoxWidget(matchId: matches.matchesList[index].matchId),
                
              );}
            ))
          ],
        ),
      ),
    );
  }
}
