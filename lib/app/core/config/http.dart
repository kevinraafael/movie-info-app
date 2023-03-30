import 'dart:convert';

import 'package:dio/dio.dart';

import '../interface/http_interface.dart';
import 'http_interceptor.dart';

class Http implements HttpInterface {
  late final Dio dio;

  Http({required this.dio}) {
    dio.interceptors.add(HttpInterceptor(dio: dio));
  }

  final defaultError = {
    "code": "INTERNAL_SERVER_ERROR",
    "execution": DateTime.now().toString(),
    "message": "Erro interno, tente novamente mais tarde",
    "thread": "",
  };

  @override
  Future get(String endpoint,
      {required Map<String, dynamic> queryParameters}) async {
    // TODO: implement get
    try {
      return await dio.get(endpoint, queryParameters: queryParameters);
    } on DioError catch (e) {
      if (e.response == null) {
        throw (defaultError);
      }
      Map response;
      response = jsonDecode(e.response.toString());
      throw (response);
    }
  }

  // @override
  // Future post(String endpoint, {required Map<String, dynamic> data}) {
  //   // TODO: implement post
  //   throw UnimplementedError();
  // }

  // @override
  // Future put(String endpoint, {required Map<String, dynamic> data}) {
  //   // TODO: implement put
  //   throw UnimplementedError();
  // }

  // @override
  // Future delete(String endpoint, {required Map<String, dynamic> data}) {
  //   // TODO: implement delete
  //   throw UnimplementedError();
  // }
}
