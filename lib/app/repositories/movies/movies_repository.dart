import 'dart:developer';

import '../../models/movie_model.dart';
import '../../core/interface/http_interface.dart';

class MoviesRepository {
  final HttpInterface http;

  MoviesRepository({required this.http});

  Future getMovie(int movieId) async {
    try {
      var response = await http.get(
        '/movie/$movieId?',
        queryParameters: {},
      );
      return MovieModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
  }
}
