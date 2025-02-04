import 'genre_model.dart';

class MovieModel {
  int? id;
  String? title;
  String? overview;
  String? posterPath;
  double? voteAverage;
  int? runtime;
  String? releaseDate;
  String? backdropPath;
  int? budget;
  List<GenreModel>? genres;
  late bool? adult;

  MovieModel({
    this.adult = false,
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.runtime,
    this.releaseDate,
    this.backdropPath,
    this.budget,
    this.genres,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adult = json['adult'];
    title = json['title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    voteAverage = double.tryParse(json['vote_average'].toString());
    runtime = json['runtime'];
    releaseDate = json['release_date'];
    backdropPath = json['backdrop_path'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = List<GenreModel>.from(
        json['genres'].map(
          (value) => GenreModel.fromJson(value),
        ),
      );
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'adult': adult,
        'title': title,
        'overview': overview,
        'posterPath': posterPath,
        'voteAverage': voteAverage,
        'runtime': runtime,
        'release_date': releaseDate,
        'backdrop_path': backdropPath,
        'budget': budget,
        //'genres': genres!.map((value) => value.toJson()).toList(),
      };
}
