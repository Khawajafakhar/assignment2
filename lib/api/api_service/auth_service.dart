import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/signup_model.dart';
import '../../consts/api_strings.dart';
import '../models/signup_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApiService with ChangeNotifier {
  String? _token;
  List<dynamic>? error;

  bool get isAuth {
    return _token != null;
  }

  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<bool> signUp(SignUpData data) async {
   try {final url = Uri.parse(ApiStrings.signUpUrl);
    
      final response = await http.post(url, body: {
        "user[email]": data.email,
        "user[first_name]": data.firstName,
        "user[last_name]": data.lastname,
        "user[password]": data.pass,
        "user[password_confirmation]": data.cnfrmPass
      });
      if (response.statusCode >= 400) {
        final decodedResponse = json.decode(response.body);
        error=decodedResponse["error_log"];
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
      }}catch(error){
        rethrow;
      }
    
  }
}
