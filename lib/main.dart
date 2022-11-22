import 'package:assigment2/screens/onBoard/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import './screens/signin/sign_in_screen.dart';
import './screens/signup/sign_up_screen.dart';
import './screens/forgot_password/forgot_password_screen.dart';
import './screens/resetpassword/reset_pass_screen.dart';
import './screens/dashboard/dashboard_screen.dart';
import './screens/addnews/add_news.dart';
import 'package:provider/provider.dart';
import 'api/api_service/auth_service.dart';
import './api/provider/selectmatch_provider.dart';
import './api/api_service/addnews_servics.dart';
import './api/api_service/get_allnews_service.dart';
import './api/provider/news_provider.dart';
import './screens/dashboard/bottom_Navigation_pages/news_page/news_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(
        create: (context) => AuthApiService()),
        ChangeNotifierProvider(
        create: (context) => SelectMatchProvider()),
        ChangeNotifierProvider(
        create: (context) => AddNewsService()),
        ChangeNotifierProvider(
        create: (context) => GetAllNewsService()),
        ChangeNotifierProvider(
        create: (context) => NewsProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: OnBoardingScreen(),
          routes: {
            SignInScreen.routeName: (context) => SignInScreen(),
            SignUpScreen.routename: (context) => const SignUpScreen(),
            ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
            ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
            DashBoardScreen.routeName: (context) => const DashBoardScreen(),
            AddNewsScreen.routeName: (context) =>const AddNewsScreen(),
            NewsPage.routeName:(context) => const NewsPage(),
          },
        ),
      );
    
  }
}
