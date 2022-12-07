import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'http://api.weatherapi.com/',
        receiveDataWhenStatusError: true
      )
    );
  }
  static Future<Response> GetData({
  required String url,
     Map<String,dynamic>? query
})async{
    return await dio!.get(url,queryParameters: query);
  }
}