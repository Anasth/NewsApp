import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getDate(String url, Map<String, dynamic> query) async {

    return await dio!.get(url, queryParameters: query);
  }

  
}
