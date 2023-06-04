import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'core/config/env_config.dart';
import 'core/config/http_interceptor.dart';
import 'modules/home/home_controller.dart';
import 'repositories/movies/movies_repository.dart';

class AppModule extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());

    // Get.put((i) => Http(dio: i.get()));
    Get.put<Dio>(
        Dio(
          BaseOptions(baseUrl: EnvConfig.baseUrl),
        ),
        tag: 'dioMovie'); //

    Get.put<Dio>(
        Dio(
          BaseOptions(baseUrl: EnvConfig.baseUrlImage),
        ),
        tag: 'dioImage'); //

    Get.put<HttpInterceptor>(
      HttpInterceptor(
        dio: Get.find<Dio>(tag: 'dioMovie'),
      ),
    );

    Get.put<MoviesRepository>(
      MoviesRepository(
        dioMovie: Get.find<Dio>(tag: 'dioMovie'),
        dioImage: Get.find<Dio>(tag: 'dioImage'),
      ),
    );
  }
}
