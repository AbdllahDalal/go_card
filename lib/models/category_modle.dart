class Category {
  final int id;
  final String categoryName;
  final String categoryImage;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
      id: json['id'],
      categoryName: json["categoryName"],
      categoryImage: json["categoryImage"]);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "categoryName": categoryName,
      "categoryImage": categoryImage,
    };
  }
}
