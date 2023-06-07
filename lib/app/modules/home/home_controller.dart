import 'dart:developer';

import 'package:get/get.dart';

import '../../models/genre_model.dart';
import '../../models/genres_list_model.dart';
import '../../models/movie_list_response_model.dart';
import '../../repositories/movies/movies_repository.dart';

class HomeController extends GetxController {
  final MoviesRepository moviesRepository = Get.find();
  final popularMoviesList = MovieListResponseModel().obs;
  final genresMovieList = GenresListModel().obs;
  final moviesByGenre = MovieListResponseModel().obs;
  RxInt selectedGenreId = RxInt(0);
  final loader = false.obs;

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
      getFirstMovieCategory(genres: genresMovieList.value.genres);

      loader.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  void getMoviesCategory({required String genreId}) async {
    try {
      moviesByGenre.value =
          await moviesRepository.getMoviesWithSpecificGenre(genreId: genreId);

      selectedGenreId.value = (int.parse(genreId));
      update([selectedGenreId]);
      refresh();
    } catch (e) {}
  }

  void getFirstMovieCategory({required List<GenreModel>? genres}) async {
    try {
      if (genres != null) {
        moviesByGenre.value = await moviesRepository.getMoviesWithSpecificGenre(
            genreId: genres.first.id.toString());
        moviesByGenre.value;
      }
    } catch (e) {}
  }

  void changePage(int value) {
    switch (value) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }
}
