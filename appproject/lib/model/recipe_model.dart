class RecipeModel {
  final String name;
  final String image;
  final double rating;
  final String totalTime;

  RecipeModel({
    this.name = "no name",
    this.image = "no images",
    this.rating = 0.0,
    this.totalTime = "0 min",
  });

  factory RecipeModel.fromJson(dynamic json) {
    return RecipeModel(
      name: json['name'] as String,
      image: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
    );
  }

  static List<RecipeModel> recipesFromSnapshot(List snapshot) {
    return snapshot.map(
        (data) {
          return RecipeModel.fromJson(data);
        }
    ).toList();
  }
}
