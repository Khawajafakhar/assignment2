import 'package:assigment2/data/netwrok/services/network_api_service.dart';

import '../data/netwrok/base_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/consts/api_strings.dart';
import '../api/models/auth_response_model.dart';
import 'dart:convert';

class AuthRepository {
  BaseApiService apiService = NetworkApiService();

  Future<void> authService(
    dynamic data,
    String url
  ) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      // var mapData = {
      //   "email": data.email,
      //   "password": data.pass,
      // };
    final response=  await apiService.getPostApiResponse( url, data);
     AuthResponse authResponse = AuthResponse.fromJson(response);
     Map<String, dynamic> userData = authResponse.toJson();
        String jsonString = jsonEncode(userData);
        prefs.setString('signUpResponse', jsonString);
    } catch (e) {
      rethrow;
    }
  }

   Future<void> signUp(dynamic data) async {
    var mapData = {
      "user[email]": data.email,
      "user[first_name]": data.firstName,
      "user[last_name]": data.lastname,
      "user[password]": data.pass,
      "user[password_confirmation]": data.cnfrmPass
    };

  await authService(mapData,ApiStrings.signUpUrl);
  }

   Future<void> logIn(dynamic data) async {
    var mapData = {
      "email": data.email,
      "password": data.pass,
    };

    await authService(mapData,ApiStrings.loginUrl);
  }
}
