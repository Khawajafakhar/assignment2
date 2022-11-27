import 'package:flutter/material.dart';
import '../models/all_news_response_model.dart';
import 'package:flutter/foundation.dart';

class NewsProvider with ChangeNotifier{
 static List<AllNewsModel> newsData=[];
List<AllNewsModel> get getNewsData{
  return newsData;
}

 void fetchAndSetFeed(List<dynamic> news){
  List<AllNewsModel> fetchedlist=[];
  for(var data in news){
    fetchedlist.add(AllNewsModel.fromJson(data));
  }
newsData=fetchedlist;
  for(var data in newsData){
    print(data.title);
  }
    notifyListeners();

}
}