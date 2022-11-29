abstract class BaseApiService{

  Future<dynamic> getGetApiResponse(dynamic header,String url);

  Future<dynamic> getPostApiResponse(dynamic header,String url,dynamic body);
}