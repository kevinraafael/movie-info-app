import 'movie_model.dart';

class MovieListResponseModel {
  int? page;
  List<MovieModel>? results;
  int? totalResults;
  int? totalPages;

  MovieListResponseModel({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  MovieListResponseModel.fromJson(Map<String, dynamic> json) {
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
