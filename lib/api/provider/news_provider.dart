import 'package:flutter/material.dart';

import '../models/all_news_response_model.dart';

class NewsProvider with ChangeNotifier {

  List<AllNewsModel> list=[];

  // List<AllNewsModel> get getList{
  //   return _list;
  // }
 

  set fetchAndSetFeed(List<dynamic> jsonResponse){
    List<AllNewsModel> fetchedList = [];
    for (var data in jsonResponse) {
      fetchedList.add(AllNewsModel.fromJson(data));
    }
    list=fetchedList;
    print(list.length);
    notifyListeners();
  }
}
