import 'package:flutter/material.dart';
import './routes_name.dart';
import '../../view/screens/signin/sign_in_screen.dart';
import '../../view/screens/signup/sign_up_screen.dart';
import '../../view/screens/forgot_password/forgot_password_screen.dart';
import '../../view/screens/resetpassword/reset_pass_screen.dart';
import '../../view/screens/dashboard/dashboard_screen.dart';
import '../../view/screens/dashboard/bottom_Navigation_pages/news_page/news_page.dart';
import '../../view/screens/addnews/add_news.dart';
import '../../view/screens/onBoard/on_boarding_screen.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RoutesName.onBoard:
      return MaterialPageRoute(builder: (BuildContext context)=> OnBoardingScreen() );
      case RoutesName.login:
      return MaterialPageRoute(builder: (BuildContext context)=> const SignInScreen() );
      case RoutesName.signUp:
      return MaterialPageRoute(builder: (BuildContext context)=> const SignUpScreen() );
      case RoutesName.forgotPassword:
      return MaterialPageRoute(builder: (BuildContext context)=> const ForgotPasswordScreen() );
      case RoutesName.resetPassword:
      return MaterialPageRoute(builder: (BuildContext context)=>  ResetPasswordScreen() );
      case RoutesName.dashBoaard:
      return MaterialPageRoute(builder: (BuildContext context)=> const DashBoardScreen() );
      case RoutesName.newsPage:
      return MaterialPageRoute(builder: (BuildContext context)=> const  NewsPage());
      case RoutesName.addNews:
      return MaterialPageRoute(builder: (BuildContext context)=> const AddNewsScreen() );
      default:
      return MaterialPageRoute(builder: (_){
        return const Scaffold(
          body: Center(child: Text('No route defined'),),
        );
      });
    }
  }
}