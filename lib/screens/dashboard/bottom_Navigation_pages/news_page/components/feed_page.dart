import 'package:assigment2/api/models/all_news_response_model.dart';
import 'package:flutter/material.dart';
import 'news_widgets.dart/news_card_widget.dart';
import '../../../../../api/api_service/get_allnews_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../../../api/provider/news_provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

    bool isLoading =true;
  @override
  void didChangeDependencies() {
if(isLoading){
  print('get lis running');
  getList();
}
setState(() {
  isLoading=!isLoading;
});
    super.didChangeDependencies();
  }

  void getList()async{
 await GetAllNewsService.getAllNews();
 
  print('did change ');
  }

  @override
  Widget build(BuildContext context) {
     var newsData =Provider.of<NewsProvider>(context);
    var feedList=newsData.list;
 print(feedList.length);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child:  ListView.builder(
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
