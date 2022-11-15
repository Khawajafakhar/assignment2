import 'package:assigment2/screens/onBoard/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import './screens/signin/sign_in_screen.dart';
import './screens/signup/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingScreen(),
      routes: {
        SignInScreen.routeName: (context) => SignInScreen(),
        SignUpScreen.routename: (context) =>  SignUpScreen()
      },
    );
  }
}
