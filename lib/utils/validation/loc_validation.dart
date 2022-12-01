import 'package:flutter/cupertino.dart';

class Validation {
  static String? isEmailValid(String val) {
    RegExp regex = RegExp(r'\w+@\w+\.\w+');
    if (val == '' || val.isEmpty) {
      return '*required';
    } else if (!regex.hasMatch(val)) {
      return '*Invalid email';
    }
    // else {
    //   return null;
    // }
    return null;
  }

  static String? isPasswordValid(String val) {
    if (val.isEmpty) {
      return '*required';
    }else if(val.length<6){
      return '*Password must contain at least 6 characters';
    }
    return null;
  }
   static String? isCnfrmPasswordValid(String val,TextEditingController pass) {
    if (val.isEmpty) {
      return '*required';
    }else if(val!=pass.text){
      return '*Password Not Matched';
    }
    return null;
  }

  static String? isUserNameValid(String val){
    RegExp regex = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if(val.isEmpty){
      return '*required';
    }else if(!regex.hasMatch(val)){
      return '*Invalid Name';
    }
    return null;
  }

  static String? isBirthDateValid(String val) {
    if (val.isEmpty) {
      return '*required';
    }
    return null;
  }
}
