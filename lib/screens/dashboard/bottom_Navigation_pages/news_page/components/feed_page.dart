import 'package:flutter/material.dart';
import 'news_widgets.dart/news_card_widget.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(itemCount: 10,itemBuilder: (context, index) => const NewsCardWidget(),),
      ),
    );
  }
}