import 'package:dio/dio.dart';

class HttpInterceptor extends InterceptorsWrapper {
  Dio dio;
  final String apiKey;
  final String language;

  HttpInterceptor({
    required this.dio,
    this.apiKey = 'b08e208bca3aabde8e08ee5ca726c391',
    this.language = 'pt-BR',
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters['api_key'] = apiKey;
    options.queryParameters['language'] = language;

    return handler.next(options);
  }
}
