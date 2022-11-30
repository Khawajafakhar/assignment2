import 'package:flutter/material.dart';
import '../repository/auth_repository.dart';
import '../utils/utils.dart';
import '../utils/routes/routes_name.dart';

class AuthViewProvider with ChangeNotifier {
  AuthRepository authRepo = AuthRepository();

 

  Future<void> loginApi(
    dynamic data,
    BuildContext context,
  ) async {
    await authRepo
        .logIn(data)
        .then((value) {
          Utils.showToast('Login Successful');
          Navigator.pushNamed(context, RoutesName.dashBoaard);
        })
        .onError((error, stackTrace) {
          Utils.showToast(error.toString());
        });
  }

   Future<void> signupApi(
    dynamic data,
    BuildContext context,
  ) async {
    await authRepo
        .signUp(data)
        .then((value) {
          Utils.showToast('Signup Successful');
          Navigator.pushNamed(context, RoutesName.dashBoaard);
        })
        .onError((error, stackTrace) {
          Utils.showToast(error.toString());
        });
  }

    Future<void> forgotPasswordApi(
    dynamic data,
    BuildContext context,
  ) async {
    await authRepo
        .forgotPassword(data)
        .then((value) {
          Utils.showToast(value.toString());
          Navigator.pushNamed(context, RoutesName.resetPassword);
        })
        .onError((error, stackTrace) {
          print(error.toString());
          Utils.showToast(error.toString());
        });
  }

  
}
