import 'package:assigment2/models/all_news_response_model.dart';
import 'package:assigment2/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../repository/news_repository.dart';
import '../utils/utils.dart';

class NewsViewProvider with ChangeNotifier {
  NewsRepository newsRepo = NewsRepository();

  static List<AllNewsModel> newsData = [];

  List<AllNewsModel> get getNews {
    return [...newsData];
  }

  void setNews(value) {
    newsData = value;
  }

  Future<void> getAllNewsApi() async {
    await newsRepo.getAllNews().then((value) {
      setNews(value);
      notifyListeners();
    }).onError((error, stackTrace) {
      Utils.showToast(error.toString());
    });
  }

  Future<void> addNews(
       BuildContext context,
      {required String? title,
      required String? discription,
      required matchId,
      }) async {
    await newsRepo
        .addNews(
      title: title,
      discription: discription,
      matchId: matchId,
    ).then((value) {
      Utils.showToast('Added');
      Navigator.pushReplacementNamed(context, RoutesName.dashBoaard);
    }).onError((error, stackTrace) {
      Utils.showToast(error.toString());
    });
  }
}
