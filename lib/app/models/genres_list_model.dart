import 'genre_model.dart';

class GenresListModel {
  List<GenreModel>? genres;

  GenresListModel({
    this.genres,
  });

  GenresListModel.fromJson(Map<String, dynamic> json) {
    genres = List<GenreModel>.from(json['genres'].map(
      (value) => GenreModel.fromJson(value),
    ));
  }
}
