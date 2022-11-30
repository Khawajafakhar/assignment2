abstract class BaseApiService{

  Future<dynamic> getGetApiResponse(dynamic header,String url);

  Future<dynamic> getPostApiResponse(String url,dynamic body,{dynamic header});
}