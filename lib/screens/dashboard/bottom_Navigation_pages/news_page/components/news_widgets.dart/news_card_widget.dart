import 'package:assigment2/api/models/all_news_response_model.dart';
import 'package:flutter/material.dart';
import '../../../../../../consts/app_colors_strings.dart';
import '../../../../../../widgets/text_widget.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:provider/provider.dart';
import '../../../../../../consts/app_img_strings.dart';

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
    // final feedData = Provider.of<AllNewsModel>(context);
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
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          gradient: AppColors.yellowishGradient2,
                          shape: BoxShape.circle),
                      child: Center(
                          child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.backGroundColor),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              AppImages.imgProfile,
                              fit: BoxFit.cover,
                            )),
                      )),
                    ),
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
                                txt:
                                    '$firstName $lastName',
                                fontSize: 16,
                                color: AppColors.colorWhite,
                              ),
                              TextWidget(
                                txt: timeago.format(
                                    DateTime.parse(createdAt!)),
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
