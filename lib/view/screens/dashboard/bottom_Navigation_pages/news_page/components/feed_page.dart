import 'package:assigment2/api/models/all_news_response_model.dart';
import 'package:flutter/material.dart';
import 'news_widgets.dart/news_card_widget.dart';
import '../../../../../../api/api_service/get_allnews_service.dart';
import '../../../../../../utils/utils.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<AllNewsModel> feedList = [];
  bool isLoading = true;
  @override
  void didChangeDependencies() async {
    if (isLoading) {
      await getList();
    }
    setState(() {
      isLoading = !isLoading;
    });
    super.didChangeDependencies();
  }

  Future<void> getList() async {
    final feedData = await GetAllNewsService.getAllNews();
    if (feedData != null) {
      feedList = feedData;
    } else {
      Utils.showToast('unable to load data');
    }
  }

  @override
  Widget build(BuildContext context) {

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
