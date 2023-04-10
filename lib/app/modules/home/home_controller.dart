import 'package:get/get.dart';
import 'package:movie_info_app/app/models/popular_movies_model.dart';

import '../../repositories/movies/movies_repository.dart';

class HomeController extends GetxController {
  final MoviesRepository moviesRepository = Get.find();
  final popularMoviesList = PopularMoviesModel().obs;
  final loader = false.obs;
  //Rx<PopularMoviesModel> popularMovies = PopularMoviesModel().obs;

  @override
  void onInit() async {
    super.onInit();
    getPopularMovies();
  }

  void getPopularMovies() async {
    try {
      loader.value = true;
      popularMoviesList.value = await moviesRepository.getPopularMovies();
    } catch (e) {
      loader.value = false;
    }
    loader.value = false;
  }
}
