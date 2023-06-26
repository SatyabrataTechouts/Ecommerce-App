class HeadModel {
  final int id;
  final String image;
  final String category;
  HeadModel({required this.id, required this.image, required this.category});
  factory HeadModel.fromJson(Map<String, dynamic> json) => HeadModel(
        id: json["id"],
        image: json["image"],
        category: json["category"],
      );
}
