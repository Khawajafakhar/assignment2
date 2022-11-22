import 'package:assigment2/api/models/signup_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../consts/api_strings.dart';

class AddNewsService with ChangeNotifier {
  dynamic uid;
  String? token;
  var error;
  Future<bool> addNews(
      {required String? title,
      required String? discription,
      required matchId}) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('signUpResponse')) {
      return false;
    }
    final prefsData =
        jsonDecode(prefs.getString('signUpResponse')!) as Map<String, dynamic>;
        print(prefsData);
    SignUpResponse userdata = SignUpResponse.fromJson(prefsData);
    uid = userdata.id;

    final mapData = jsonEncode({
      "news": {
        
          "title": title,
          "description": discription,
          "user_id": uid,
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
        print(json.decode(response.body));
        error = json.decode(response.body);
        return false;
      }
    } catch (error) {
      print('error : $error');
      rethrow;
    }
  }
}
