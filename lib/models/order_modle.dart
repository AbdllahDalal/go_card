import 'card_prodect_modle.dart';

class Order {
  final String id;
  final String date;
  final String paymentStatus;
  final String deliveryStatus;
  final double amount;
  final List<CardProdect> prodects;

  Order({
    required this.id,
    required this.date,
    required this.paymentStatus,
    required this.deliveryStatus,
    required this.amount,
    required this.prodects,
  });
}
