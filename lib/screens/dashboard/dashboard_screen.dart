import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/bottom_appbar_widget.dart';
import './pages/fixture_page.dart';
import './pages/home_page.dart';
import './pages/leader_page.dart';
import './pages/news_page.dart';
import './pages/settings_page.dart';

class DashBoardScreen extends StatefulWidget {
  static const routeName = 'dashboard-screen';
  DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int index = 3;

  var pages = [
   const HomePage(),
   const FixturePage(),
   const LeaderPage(),
   const NewsPage(),
   const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          isLeading: true,
          isTrailing: true,
          trailingIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          ),
          islogo: true,
        ),
        drawer:const Drawer(),
        bottomNavigationBar: BottomAppBarWidget(
          index: index,value: changePage,
        ),
        body: pages[index],
      ),
    );
  }

  void changePage(value){
  setState(() {
    index=value;
  });
  }
}
