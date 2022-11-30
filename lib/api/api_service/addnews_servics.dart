import 'package:assigment2/api/models/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../res/consts/api_strings.dart';

class AddNewsService {
  static Future<bool> addNews(
      {required String? title,
      required String? discription,
      required matchId}) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('signUpResponse')) {
      return false;
    }
    final prefsData =
        jsonDecode(prefs.getString('signUpResponse')!) as Map<String, dynamic>;
    AuthResponse userdata = AuthResponse.fromJson(prefsData);

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
      final url = Uri.parse(ApiStrings.addNewsUrl);
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Charset": "utf-8",
            "apitoken": "${prefsData['api_token']}"
          },
          body: mapData);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }
}
