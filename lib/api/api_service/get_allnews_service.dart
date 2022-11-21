import 'package:http/http.dart' as http;
import '../../consts/api_strings.dart';

class GetAllNewsService{
   Future<void> getAllNews() async{
    var url = Uri.http(ApiStrings.getAllNewsUrl,'api/v1/news?league_id=39');
   }
}