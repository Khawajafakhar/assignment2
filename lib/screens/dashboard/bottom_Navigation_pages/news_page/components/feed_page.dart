import 'package:flutter/material.dart';
import 'news_widgets.dart/news_card_widget.dart';
import '../../../../../api/api_service/get_allnews_service.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder(
            future: GetAllNewsService.getAllNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: Text('No News added'),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                      value: snapshot.data![index],
                      child: const NewsCardWidget()),
                );
              }
            }),
      ),
    );
  }
}
