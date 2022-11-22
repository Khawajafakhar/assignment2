import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../consts/api_strings.dart';
import 'dart:convert';
import '../provider/news_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllNewsService with ChangeNotifier {
  String? error;
  String? token;
  Future<bool> getAllNews() async {
    var url = Uri.parse(ApiStrings.getAllNewsUrl);

    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('signUpResponse')) {
      return false;
    }
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
        error = json.decode(response.body).toString();
        return false;
      } else {
        NewsProvider newsProvider = NewsProvider();
        newsProvider.fetchAndSetFeed(json.decode(response.body));
        return true;
      }
    } catch (error) {
      rethrow;
    }
  }
}
