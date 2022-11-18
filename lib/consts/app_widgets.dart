import 'package:assigment2/consts/app_text_strings.dart';
import 'package:flutter/material.dart';
import './app_img_strings.dart';
import '../widgets/text_widget.dart';
import './app_colors_strings.dart';

class AppWidgets {
  static final avatar = [
    CircleAvatar(
      child: Image.asset(AppImages.imgLeagLogo1),
    ),
    CircleAvatar(
      child: Image.asset(AppImages.imgLeagLogo3),
    ),
    CircleAvatar(
      child: Image.asset(AppImages.imgLeagLogo1),
    ),
    CircleAvatar(
      child: Image.asset(AppImages.imgLeagLogo3),
    ),
    CircleAvatar(
      child: Image.asset(
        AppImages.imgLeagLogo1,
      ),
    ),
    CircleAvatar(
      child: Image.asset(AppImages.imgLeagLogo3),
    ),
  ];

  static const titleList = [
    TextWidget(
      txt: AppStrings.fifaMatchTxt,
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: AppStrings.premierLeagTxt,
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: AppStrings.uefaleagTxt,
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: AppStrings.fifaMatchTxt,
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: AppStrings.premierLeagTxt,
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: AppStrings.uefaleagTxt,
      color: AppColors.colorWhite,
    ),
  ];

  static const subTitleList = [
    TextWidget(
      txt: AppStrings.engMatchTxt,
      color: AppColors.colorWhite,
      fontSize: 12,
    ),
    TextWidget(
      txt: AppStrings.chlMatchTxt,
      color: AppColors.colorWhite,
      fontSize: 12,
    ),
    TextWidget(
      txt: AppStrings.ufcmatchTxt,
      color: AppColors.colorWhite,
      fontSize: 12,
    ),
    TextWidget(
      txt: AppStrings.engMatchTxt,
      color: AppColors.colorWhite,
      fontSize: 12,
    ),
    TextWidget(
      txt: AppStrings.chlMatchTxt,
      color: AppColors.colorWhite,
      fontSize: 12,
    ),
    TextWidget(
      txt: AppStrings.ufcmatchTxt,
      color: AppColors.colorWhite,
      fontSize: 12,
    ),
  ];

  static const drawertxtList = [
    TextWidget(
      txt: 'Profile',
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: 'My Predictions',
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: 'FAQs',
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: 'Privacy Policy',
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: 'Terms of Services',
      color: AppColors.colorWhite,
    ),
    TextWidget(
      txt: 'Admin',
      color: AppColors.colorWhite,
    ),
  ];
}
