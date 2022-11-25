import 'package:http/http.dart' as http;
import '../../consts/api_strings.dart';
import 'dart:convert';
import '../provider/news_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllNewsService  {
  // String? token;
 static Future<void> getAllNews() async {
    var url = Uri.parse(ApiStrings.getAllNewsUrl);

    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('signUpResponse')) {
      
    
    final prefsData =
        jsonDecode(prefs.getString('signUpResponse')!) as Map<String, dynamic>;
    try {
      print('get request running');
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Charset": "utf-8",
          "apitoken": "${prefsData['api_token']}"
        },
      );
      if (response.statusCode >= 400) {
        print('Error : ${jsonDecode(response.body)}');
      } else {
        print('positive http response');
        NewsProvider newsProvider = NewsProvider();
       newsProvider.fetchAndSetFeed=json.decode(response.body);
        
      }
    } catch (error) {
      rethrow;
    }}
  }
}
