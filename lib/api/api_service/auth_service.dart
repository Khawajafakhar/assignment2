import 'dart:convert';
import 'package:assigment2/consts/app_colors_strings.dart';
import 'package:http/http.dart' as http;
import '../models/signup_model.dart';
import '../../consts/api_strings.dart';
import '../models/signup_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/signin_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthApiService {
  static Map<String, dynamic>? restResponse;

  static Future<bool> auth({
    required Map<String, String?> data,
    required String urlPart,
  }) async {
    try {
      final url = Uri.parse("http://54.197.94.1/api/v1/$urlPart/");

      final response = await http.post(url, body: data);
      if (response.statusCode >= 400) {
        return false;
      } else {
        final decodedResponse = json.decode(response.body);
        AuthResponse responseData = AuthResponse.fromJson(decodedResponse);
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

  static Future<bool> signUp(SignUpData data) async {
    var mapData = {
      "user[email]": data.email,
      "user[first_name]": data.firstName,
      "user[last_name]": data.lastname,
      "user[password]": data.pass,
      "user[password_confirmation]": data.cnfrmPass
    };

    return auth(data: mapData, urlPart: 'users');
  }

  static Future<bool> logIn(SignInData data) async {
    var mapData = {
      "email": data.email,
      "password": data.pass,
    };

    return auth(data: mapData, urlPart: 'sessions');
  }

  static Future<bool> forgotPassword(String email) async {
    try {
      final url = Uri.parse(ApiStrings.forgotPassUrl);
      final response = await http.put(url, body: {"email": email});
      if (response.statusCode >= 400) {
        return false;
      } else {
        restResponse = jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: jsonDecode(response.body).toString(),
          toastLength: Toast.LENGTH_LONG,
          textColor: AppColors.colorWhite,
        );
        return true;
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('signUpResponse')) {
      return false;
    } else {
      return true;
    }
  }
}
