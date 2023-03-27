import 'package:dio/dio.dart';

class HttpInterceptor extends InterceptorsWrapper {
  Dio dio;

  HttpInterceptor({required this.dio});
}
