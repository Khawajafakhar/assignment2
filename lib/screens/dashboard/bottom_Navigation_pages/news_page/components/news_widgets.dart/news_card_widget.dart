import 'package:flutter/material.dart';
import '../../../../../../consts/app_colors_strings.dart';
import './feed_img_widget.dart';
import '../../../../../../widgets/text_widget.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backGroundColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    FeedImgWidget(),
                  ],
                )),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                          height: 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              TextWidget(
                                txt: 'James FC',
                                fontSize: 18,
                                color: AppColors.colorWhite,
                              ),
                              TextWidget(
                                txt: '1 minute ago',
                                fontSize: 12,
                                color: AppColors.richTextBtnColor,
                              )
                            ],
                          )),
                      Expanded(
                          child:  TextWidget(
                            color: AppColors.colorWhite.withOpacity(0.6),
                            fontSize: 12,
                            txt:
                                'Gianni Infantino’s presidency has focused on bringing wide-ranging reforms to FIFA, expanding global participation in FIFA’s flagship competitions and boosting FIFA’s investment in football.',
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
