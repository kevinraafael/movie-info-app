import 'dart:developer';

import '../../core/interface/http_interface.dart';

class MoviesRepository {
  final HttpInterface http;

  MoviesRepository({required this.http});

  final api =
      "https://api.themoviedb.org/3/movie/5?api_key=b08e208bca3aabde8e08ee5ca726c391&language=pt-BR";

  Future<void> getMovie(Map<String, dynamic> data) async {
    try {
      var response = await http.get(api, queryParameters: data);
      print(response);
    } catch (e) {
      log(e.toString());
    }
  }
}
