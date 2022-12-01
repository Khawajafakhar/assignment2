import 'package:assigment2/view/screens/onBoard/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'view/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'view_model/selectmatch_provider.dart';
import './utils/routes/routes.dart';
import './view_model/auth_provider.dart';
import './view_model/news_view_provider.dart';

void main() {
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectMatchProvider>(
          create: (context) => SelectMatchProvider(),
        ),
        ChangeNotifierProvider<AuthViewProvider>(
          create: (context) => AuthViewProvider(),
        ),
        ChangeNotifierProvider<NewsViewProvider>(
          create: (context) => NewsViewProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Assignment 2',
        home: Builder(
          builder: (context) {
            return FutureBuilder(
              future: context.read<AuthViewProvider>().tryAutoLogin(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.data == true) {
                    return const DashBoardScreen();
                  } else {
                    return OnBoardingScreen();
                  }
                }
              },
            );
          },
        ),
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
