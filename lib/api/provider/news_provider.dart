import '../models/all_news_response_model.dart';

class NewsProvider {
 

  List<AllNewsModel> fetchAndSetFeed(List<dynamic> jsonResponse) {
    List<AllNewsModel> fetchedList = [];
    for (var data in jsonResponse) {
      fetchedList.add(AllNewsModel.fromJson(data));
    }
    return fetchedList;
  }
}
