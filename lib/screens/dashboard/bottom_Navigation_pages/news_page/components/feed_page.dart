import 'package:flutter/material.dart';
import 'news_widgets.dart/news_card_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../api/provider/news_provider.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Consumer<NewsProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.getNewsData.length,
            itemBuilder: (context, index) =>  NewsCardWidget(
                createdAt: value.getNewsData[index].createdAt,
                discription: value.getNewsData[index].description,
                firstName: value.getNewsData[index].user!.firstName,
                lastName: value.getNewsData[index].user!.lastName,
                ),
          ),
        ));
  }
}
