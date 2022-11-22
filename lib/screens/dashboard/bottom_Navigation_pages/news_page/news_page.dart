import 'package:flutter/material.dart';
import '../../../../consts/app_img_strings.dart';
import '../../../../consts/app_colors_strings.dart';
import '../../../../widgets/buttons/floating_button_widget.dart';
import 'components/news_widgets.dart/tabbar_widget.dart';
import 'components/approvals_page.dart';
import 'components/feed_page.dart';
import 'components/my_feed_page.dart';

class NewsPage extends StatefulWidget {
  static const routeName='news-feed-page';
 const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int currentIndex = 0;

  List newsPages = [
    const FeedPage(),
    const MyFeedPage(),
    const ApprovalsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        floatingActionButton: const FloatingButtonWidget(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              TabBarWidget(index: currentIndex, selectedIndex: selectedPage),
              Flexible(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      AppImages.imgBackground,
                    ),
                    fit: BoxFit.fill,
                  )),
                  child: newsPages[currentIndex],
                ),
              )
            ],
          ),
        ));
  }

  void selectedPage(index) {
    setState(() {
      currentIndex = index;
    });
  }
}
