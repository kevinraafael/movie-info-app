import 'package:movie_info_app/app/models/movie_model.dart';

class PopularMoviesModel {
  int? page;
  List<MovieModel>? results;
  int? totalResults;
  int? totalPages;

  PopularMoviesModel({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    results = List<MovieModel>.from(json['results'].map(
      (value) => MovieModel.fromJson(value),
    ));
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results!.map((value) => value.toJson()).toList(),
        'total_results': totalResults,
        'total_pages': totalPages,
      };
}
