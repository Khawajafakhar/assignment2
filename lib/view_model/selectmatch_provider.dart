import '../models/selectmatch_model.dart';
import '../res/consts/app_img_strings.dart';
import 'package:flutter/material.dart';

class SelectMatchProvider with ChangeNotifier {
  List<SelectMatchModel> matchesList = [
    SelectMatchModel(
      leagTitle: 'FIFA Matches',
      matchTitle: 'ENG-GR',
      leagImg: AppImages.imgLeagLogo1,
      matchId: 1,
    ),
    SelectMatchModel(
      leagTitle: 'Premier League',
      matchTitle: 'CHL-ARS',
      leagImg: AppImages.imgLeagLogo3,
      matchId: 2,
    ),
    SelectMatchModel(
      leagTitle: 'UEFA Champion League',
      matchTitle: 'UFC-ARS',
      leagImg: AppImages.imgLeagLogo1,
      matchId: 3,
    ),
     SelectMatchModel(
      leagTitle: 'FIFA Matches',
      matchTitle: 'ENG-GR',
      leagImg: AppImages.imgLeagLogo3,
      matchId: 1,
    ),
     SelectMatchModel(
      leagTitle: 'Premier League',
      matchTitle: 'CHL-ARS',
      leagImg: AppImages.imgLeagLogo1,
      matchId: 2,
    ),
     SelectMatchModel(
      leagTitle: 'UEFA Champion League',
      matchTitle: 'UFC-ARS',
      leagImg: AppImages.imgLeagLogo3,
      matchId: 3,
    ),
    

  ];
}
