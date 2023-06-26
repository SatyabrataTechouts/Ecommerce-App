class ApiModel {
  final num? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  int? qnt;
  ApiModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.qnt,
  });
  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: Rating.fromJson(
        json['rating'],
      ),
      qnt: json["qnt"] as int?,
    );
  }
  void setQuantity(int quantity) {
    qnt = quantity;
  }
}

class Rating {
  final num rate;
  final num count;
  Rating({
    required this.rate,
    required this.count,
  });
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"],
        count: json["count"],
      );
}
