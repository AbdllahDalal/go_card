import 'package:dream_store_app/models/prodect_modle.dart';

class CardProdect {
  final int id;
  final Prodect prodect;
  final String image;
  final int colorIndex;
  late int quantity;
  final Map<String, dynamic> specifications;

  CardProdect({
    required this.id,
    required this.prodect,
    required this.colorIndex,
    required this.image,
    required this.quantity,
    required this.specifications,
  });

  factory CardProdect.fromMap(Map<String, dynamic> json) => CardProdect(
      id: json['id'],
      prodect: json["prodect"],
      colorIndex: json["colorIndex"],
      image: json["image"],
      quantity: json["quantity"],
      specifications: json["specifications"]);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "prodect": prodect,
      "colorIndex": colorIndex,
      "image": image,
      "quantity": quantity,
      "specifications": specifications,
    };
  }
}
