// ignore: file_names
import 'package:dream_store_app/models/prodect_modle.dart';

class MessageAI {
  final int id;
  final bool isAi;
  final String text;
  final List<Prodect> prodects;

  MessageAI({
    required this.id,
    required this.isAi,
    required this.text,
    required this.prodects,
  });
}
