import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static intit() {
    dio = Dio(BaseOptions(
      // baseUrl: 'https://student.valuxapps.com/api/',
      // baseUrl: 'http://178.128.146.68/',
      // baseUrl: 'https://jigsawork.developmentyard.net/api/auth/',
      baseUrl: 'http://178.128.146.68/',
      // baseUrl: 'http://178.128.146.68/getAllItemsCardPostman?companyCode=PQK5',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postDataLOGIN({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return dio.post(url = url, data: {});
    // return dio.post(url = url, data: {});
  }

  static Future<Response> postData(
      {required String url,
      // Map<String, dynamic>? query,
      // String lang = 'ar',
      required String? data}) async {
    // required Map<String, dynamic>? data}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Content-Length': '<calculated when request is sent>',
      'Host': '<calculated when request is sent>',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      // 'Cookie':
      //     'session=eyJfcGVybWFuZW50IjpmYWxzZSwibGFzdF9hY3RpdmUiOnsiIGQiOiJUdWUsIDAyIEF1ZyAyMDIyIDEyOjEwOjA2IEdNVCJ9fQ.YukUHg.iz9CunsvXuVzvDH-8Aukb09fBWU'
    };
    return dio.post(url, data: data);
  }

  static Future<Response> getData2(
      // required String url,
      ) async {
    return await dio.get(
      // 'http://178.128.146.68/customersCheckNamePostman?companyCode=9SW3&customerName=عملاء',
      'http://178.128.146.68/customersCheckCodePostman?companyCode=9SW3&customerCode=aref',
    );
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'ar',
      String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  // static Future<Response> postData(
  //     {required String url,
  //     Map<String, dynamic>? query,
  //     String lang = 'ar',
  //     String? token,
  //     required Map<String, dynamic>? data}) async {
  //   dio.options.headers = {
  //     'lang': lang,
  //     'Authorization': token,
  //     'Content-Type': 'application/json'
  //   };
  //   return dio.post(url, queryParameters: query, data: data);
  // }

  static Future<Response> puttData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'ar',
      String? token,
      required Map<String, dynamic>? data}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    return dio.put(url, queryParameters: query, data: data);
  }
}
