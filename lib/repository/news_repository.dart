import 'package:assigment2/models/all_news_response_model.dart';
import 'package:assigment2/data/app_exceptions.dart';
import '../data/netwrok/services/network_api_service.dart';
import '../res/consts/api_strings.dart';
import '../data/netwrok/base_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/auth_response_model.dart';

class NewsRepository {
  BaseApiService apiService = NetworkApiService();

  Future<dynamic> getAllNews() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('userData')) {
      final prefsData = jsonDecode(prefs.getString('userData')!)as Map<String,dynamic>;
       String token = prefsData['api_token'];
      try {
        final response = await apiService.getGetApiResponse(
          {
            "Content-Type": "application/json",
            "Charset": "utf-8",
            "apitoken": token
          },
          ApiStrings.getAllNewsUrl,
        );
        List<AllNewsModel> fetchedList = [];
        for (var data in response) {
          fetchedList.add(AllNewsModel.fromJson(data));
        }
        return fetchedList;
      } catch (error) {
        rethrow;
      }
    } else {
      throw UnathorizedException(message: 'Access Denied');
    }
  }


   Future<dynamic> addNews(
      {required String? title,
      required String? discription,
      required matchId}) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userData')) {
     
    final prefsData =
        jsonDecode(prefs.getString('userData')!) as Map<String, dynamic>;
    AuthResponse userdata = AuthResponse.fromJson(prefsData);
    String token = prefsData['api_token'];    
    final mapData = jsonEncode({
      "news": {
        "title": title,
        "description": discription,
        "user_id": userdata.id,
        "league_id": 39,
        "match_id": matchId
      }
    });

    try {
      final response = await apiService.getPostApiResponse(ApiStrings.addNewsUrl,
           mapData,
           header: {
            "Content-Type": "application/json",
            "Charset": "utf-8",
            "apitoken": token
          },);
      return response;
    } catch (error) {
      rethrow;
    }}else{
      return UnathorizedException(message: 'Access denied');
    }

  }
}
