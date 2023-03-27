import 'dart:developer';

import '../../app/models/movie_model.dart';
import '../../core/interface/http_interface.dart';

class MoviesRepository {
  final HttpInterface http;

  MoviesRepository({required this.http});

  final api =
      "https://api.themoviedb.org/3/movie/5?api_key=b08e208bca3aabde8e08ee5ca726c391&language=pt-BR";

  Future getMovie(Map<String, dynamic> data) async {
    try {
      var response = await http.get(api, queryParameters: data);
      return MovieModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
  }
}
