import 'package:http/http.dart' as http;
import '../../res/consts/api_strings.dart';
import 'dart:convert';
import '../provider/news_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/models/all_news_response_model.dart';

class GetAllNewsService  {
  String? token;
 static Future<List<AllNewsModel>?> getAllNews() async {
    var url = Uri.parse(ApiStrings.getAllNewsUrl);

    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('signUpResponse')) {
      
    
    final prefsData =
        jsonDecode(prefs.getString('signUpResponse')!) as Map<String, dynamic>;
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Charset": "utf-8",
          "apitoken": "${prefsData['api_token']}"
        },
      );
      if (response.statusCode >= 400) {
        print(jsonDecode(response.body));
        return null;
      } else {
        NewsProvider newsProvider = NewsProvider();
      return  newsProvider.fetchAndSetFeed(json.decode(response.body));
        
      }
    } catch (error) {
      rethrow;
    }}
    return null;
  }
}
