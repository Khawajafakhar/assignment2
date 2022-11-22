import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/signup_model.dart';
import '../../consts/api_strings.dart';
import '../models/signup_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/signIn_model.dart';

class AuthApiService with ChangeNotifier {
  String? _token;
  List<dynamic>? error;
  Map<String,dynamic>? restResponse;

  bool get isAuth {
    return _token != null;
  }

  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<bool> auth(
      {required Map<String, String?> data, required String urlPart}) async {
    try {
      final url = Uri.parse("http://54.197.94.1/api/v1/$urlPart/");

      final response = await http.post(url, body: data);
      if (response.statusCode >= 400) {
        final decodedResponse = json.decode(response.body);
        error = decodedResponse["error_log"];
        return false;
      } else {
        final decodedResponse = json.decode(response.body);
        _token = decodedResponse["api_token"];
        SignUpResponse responseData = SignUpResponse.fromJson(decodedResponse);
        Map<String, dynamic> userData = responseData.toJson();
        String jsonString = jsonEncode(userData);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('signUpResponse', jsonString);
        return true;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> signUp(SignUpData data) async {
    var mapData = {
      "user[email]": data.email,
      "user[first_name]": data.firstName,
      "user[last_name]": data.lastname,
      "user[password]": data.pass,
      "user[password_confirmation]": data.cnfrmPass
    };

    return auth(data: mapData, urlPart: 'users');
  }

  Future<bool> logIn(SignInData data) async {
    var mapData = {
      "email": data.email,
      "password": data.pass,
    };

    return auth(data: mapData, urlPart: 'sessions');
  }

  Future<bool> forgotPassword(String email) async {
    try {
      final url = Uri.parse(ApiStrings.forgotPassUrl);
      final response = await http.put(url, body: {"email": email});
      if (response.statusCode >= 400) {
        error = jsonDecode(response.body);
        return false;
      } else {
        restResponse=jsonDecode(response.body);
        return true;
      }
    } catch (error) {
      rethrow;
    }
  }
}
