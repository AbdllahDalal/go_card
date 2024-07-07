class Prodect {
  final int id;
  final String name;
  final List<String> image;
  final String discreption;
  final double price;
  final List colors;
  final Map<String, List> specifications;
  final int categoryId;

  Prodect({
    required this.id,
    required this.name,
    required this.image,
    required this.discreption,
    required this.price,
    required this.colors,
    required this.specifications,
    required this.categoryId,
  });
}
