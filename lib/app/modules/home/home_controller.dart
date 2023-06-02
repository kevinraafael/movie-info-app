import 'dart:developer';

import 'package:get/get.dart';

import '../../models/genres_list_model.dart';
import '../../models/popular_movies_model.dart';
import '../../repositories/movies/movies_repository.dart';
import '../../routes/app_routes.dart';

class HomeController extends GetxController {
  final MoviesRepository moviesRepository = Get.find();
  final popularMoviesList = PopularMoviesModel().obs;
  final genresMovieList = GenresListModel().obs;

  final loader = false.obs;
  final needDivider = false.obs;
  Rx<bool> isCategorySelected = false.obs;
  //Rx<PopularMoviesModel> popularMovies = PopularMoviesModel().obs;

  @override
  void onInit() async {
    super.onInit();
    loader.value = true;
    getPopularMovies();
    getGenresMovies();
  }

  void getPopularMovies() async {
    try {
      popularMoviesList.value = await moviesRepository.getPopularMovies();
    } catch (e) {
      loader.value = false;
    }
  }

  void getGenresMovies() async {
    try {
      genresMovieList.value = await moviesRepository.getGenres();
      genresMovieList;
      loader.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  void changePage(int value) {
    switch (value) {
      case 0:
        break;
      case 1:
        Get.toNamed(AppRoutes.movieDetails);
        break;
      case 2:
        break;
    }
  }
}
