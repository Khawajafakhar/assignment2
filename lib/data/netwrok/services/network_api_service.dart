import 'dart:io';
import 'package:assigment2/data/netwrok/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(
    header,
    String url,
  ) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: header,
          )
          .timeout(const Duration(seconds: 20));
      jsonResponse = retrunJson(response);
    } on SocketException {
      return FetchDataException(message: 'No Internet');
    }
    return jsonResponse;
  }

  @override
  Future getPostApiResponse(String url, body, {header}) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: header
      );
      jsonResponse = retrunJson(response);
    } on SocketException {
      return FetchDataException(message: 'No Internet');
    }
    return jsonResponse;
  }

  @override
  Future getPutApiResponse(String url, body) async {
    dynamic jsonResponse;
    try {
      final response = await http.put(
        Uri.parse(url),
        body: body,
      );
      jsonResponse = retrunJson(response);
    } on SocketException {
      return FetchDataException(message: 'No Internet');
    }
    return jsonResponse;
  }

  dynamic retrunJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic decoded = json.decode(response.body);
        return decoded;
      case 201:
        dynamic decoded = json.decode(response.body);
        return decoded;
      case 400:
        throw BadRequestException(message: response.statusCode.toString());
      case 401:
        throw UnathorizedException(message: response.statusCode.toString());
      case 422:
        throw BadDataException(message: response.statusCode.toString());
      case 404:
        throw BadDataException(message: response.statusCode.toString());
      default:
        throw FetchDataException(
            message:
                'Error with status code ${response.statusCode.toString()}');
    }
  }
}
