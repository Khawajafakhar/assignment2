import 'package:assigment2/api/api_service/get_allnews_service.dart';
import 'package:flutter/material.dart';
import '../models/all_news_response_model.dart';

class NewsProvider with ChangeNotifier {
  List<AllNewsModel> feed = [];

  void fetchAndSetFeed(List<dynamic> jsonResponse) {
    List<AllNewsModel> fetchedList =
        jsonResponse.map((e) => AllNewsModel.fromJson(e)).toList();
    feed = fetchedList;
    notifyListeners();
  }
}
