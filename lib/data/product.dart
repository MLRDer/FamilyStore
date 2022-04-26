class Product {
  final int id;
  final int price;
  final double rating;
  final String image;
  final String description;
  final String type; // this is enum ["men", "women", "children"]
  final String category; // product category ["shoe", "watch", ...]
  final int sold;
  final int left;

  Product(
      {required this.id,
      required this.price,
      required this.rating,
      required this.image,
      required this.description,
      required this.type,
      required this.category,
      required this.left,
      required this.sold});
}
