import 'package:assigment2/models/all_news_response_model.dart';
import 'package:flutter/material.dart';
import 'news_widgets.dart/news_card_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../../view_model/news_view_provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool isLoading = true;
  @override
  void didChangeDependencies() async {
    if (isLoading) {
      await Provider.of<NewsViewProvider>(context, listen: false)
          .getAllNewsApi()
          .then((_) {
        setState(() {
          isLoading = !isLoading;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<AllNewsModel> feedList = context.watch<NewsViewProvider>().getNews;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: feedList.length,
                itemBuilder: (context, index) => NewsCardWidget(
                  firstName: feedList[index].user!.firstName,
                  lastName: feedList[index].user!.lastName,
                  discription: feedList[index].description,
                  createdAt: feedList[index].createdAt,
                ),
              ),
      ),
    );
  }
}
