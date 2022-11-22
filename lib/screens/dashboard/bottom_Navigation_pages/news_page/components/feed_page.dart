import 'package:flutter/material.dart';
import 'news_widgets.dart/news_card_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../api/provider/news_provider.dart';
import '../../../../../api/api_service/get_allnews_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool isLoading = true;
  @override
  void didChangeDependencies() {
    if (isLoading) {
      Provider.of<GetAllNewsService>(context).getAllNews().then((response) {
        if (response == true) {
          setState(() {
            isLoading = !isLoading;
          });
        }else{
       Fluttertoast.showToast(msg: 'not working');
        }
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final feedData = Provider.of<NewsProvider>(context).getFeed;
    print('runnin..!!');

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
                itemCount: feedData.length,
                itemBuilder: (context, index) => NewsCardWidget(
                  firstName: feedData[index].user!.firstName,
                  lastName: feedData[index].user!.lastName,
                  discription: feedData[index].description,
                  createdAt: feedData[index].createdAt,
                ),
              ),
      ),
    );
  }
}
