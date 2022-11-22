import 'package:flutter/material.dart';
import '../models/all_news_response_model.dart';

class NewsProvider with ChangeNotifier {
  List<AllNewsModel> feed = [];

  List<AllNewsModel> get getFeed {
    return feed;
  }

  void fetchAndSetFeed(List<dynamic> jsonResponse) {
    List<AllNewsModel> fetchedList = [];
    for (var data in jsonResponse) {
      fetchedList.add(AllNewsModel.fromJson(data));
    }
    feed = fetchedList;
    notifyListeners();
  }
}
