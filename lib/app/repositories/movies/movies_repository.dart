import 'dart:developer';

import 'package:dio/dio.dart';
import '../../core/config/http_interceptor.dart';

import '../../models/movie_model.dart';

class MoviesRepository {
  final Dio dioMovie;
  final Dio dioImage;

  MoviesRepository({
    required this.dioMovie,
    required this.dioImage,
  }) {
    dioMovie.interceptors.add(HttpInterceptor(dio: dioMovie));
  }

  Future getMovieInfo(int movieId) async {
    try {
      var response = await dioMovie.get(
        '/movie/$movieId?',
        queryParameters: {},
      );
      return MovieModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
  }

  Future getMovieImage() async {
    try {
      var response = await dioImage.get(
        '',
        queryParameters: {},
      );
      log(response.data);
      return (response.data);
    } catch (e) {
      log(e.toString());
    }
  }
}
