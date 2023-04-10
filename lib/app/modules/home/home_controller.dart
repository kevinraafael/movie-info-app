import 'package:get/get.dart';
import 'package:movie_info_app/app/models/popular_movies_model.dart';

import '../../repositories/movies/movies_repository.dart';

class HomeController extends GetxController {
  final MoviesRepository moviesRepository = Get.find();
  final popularMoviesList = PopularMoviesModel().obs;

  //Rx<PopularMoviesModel> popularMovies = PopularMoviesModel().obs;

  @override
  void onInit() {
    super.onInit();
    getPopularMovies();
  }
  /*  void incrementCounter() {
    counter++;
    update();
  } */

  void getPopularMovies() async {
    popularMoviesList.value = await moviesRepository.getPopularMovies();
    popularMoviesList;
  }
}
