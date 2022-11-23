import 'package:flutter/material.dart';
import '../../../../../../consts/app_colors_strings.dart';
import './feed_img_widget.dart';
import '../../../../../../widgets/text_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    super.key,
    this.firstName,
    this.lastName,
    this.discription,
    this.createdAt,
  });
  final String? firstName;
  final String? lastName;
  final String? discription;
  final String? createdAt;

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
                            children: [
                              TextWidget(
                                txt: '$firstName $lastName',
                                fontSize: 16,
                                color: AppColors.colorWhite,
                              ),
                              TextWidget(
                                txt: timeago.format(DateTime.parse(createdAt!)),
                                fontSize: 12,
                                color: AppColors.richTextBtnColor,
                              )
                            ],
                          )),
                      Expanded(
                          child: TextWidget(
                            overFlow: TextOverflow.ellipsis,
                            color: AppColors.colorWhite.withOpacity(0.6),
                            fontSize: 12,
                            txt: discription,
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
