import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/bottom_appbar_widget.dart';
import 'bottom_Navigation_pages/fixture_page.dart';
import 'bottom_Navigation_pages/home_page.dart';
import 'bottom_Navigation_pages/leader_page.dart';
import 'bottom_Navigation_pages/news_page/news_page.dart';
import 'bottom_Navigation_pages/settings_page.dart';
import '../../widgets/drawer/drawer_widget.dart';

class DashBoardScreen extends StatefulWidget {
  static const routeName = 'dashboard-screen';
 const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int index = 3;

  var pages = [
   const HomePage(),
   const FixturePage(),
   const LeaderPage(),
    NewsPage(),
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
        drawer:const DrawerWidget(),
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
