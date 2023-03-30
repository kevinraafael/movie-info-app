import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../core/config/env_config.dart';
import '../../core/config/http.dart';
import '../../core/interface/http_interface.dart';
import '../../repositories/movies/movies_repository.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());

    // Get.put((i) => Http(dio: i.get()));
    Get.put<Dio>(Dio(BaseOptions(baseUrl: EnvConfig.baseUrl))); //

    Get.put<HttpInterface>(Http(
      dio: Get.find<Dio>(),
    ));
    Get.put<MoviesRepository>(
        MoviesRepository(http: Get.find<HttpInterface>()));
  }
}
