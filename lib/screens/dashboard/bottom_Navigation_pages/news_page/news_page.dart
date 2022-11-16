import 'package:flutter/material.dart';
import '../../../../consts/app_img_strings.dart';
import '../../../../consts/app_colors_strings.dart';
import '../../../../widgets/text_widget.dart';
import '../../../../consts/app_text_strings.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: SizedBox(
                  height: 50,
                  child: Material(
                    color: AppColors.textFieldColor,
                    child: TabBar(
                        indicatorColor: AppColors.indicatorColor,
                        labelColor: AppColors.indicatorColor,
                        unselectedLabelColor: AppColors.colorWhite,
                        tabs: [
                          TextWidget(
                            txt: AppStrings.feedsTxt,
                          ),
                          TextWidget(
                            txt: AppStrings.myFeedsTxt,
                          ),
                          TextWidget(
                            txt: AppStrings.approvelTxt,
                          ),
                        ]),
                  ))),
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.imgBackground),
                    fit: BoxFit.cover)),
                    child: const Center(child: Text('hello',style: TextStyle(backgroundColor: AppColors.colorWhite),))),
          ),
        );
  }
}
