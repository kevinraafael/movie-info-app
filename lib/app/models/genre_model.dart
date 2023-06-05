class GenreModel {
  int? id;
  String? name;
  bool? isSelected;

  GenreModel({
    this.id,
    this.name,
    this.isSelected,
  });

  GenreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
