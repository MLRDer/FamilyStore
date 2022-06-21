class Product {
  final int id; // id
  final int price; // narx
  final double rating; // reyting
  final String image; // rasm
  final String description; // ta'rif
  final String type; // kim uchunligi
  final String category; // kategoriyasi
  final int sold; // nechta sotilgani
  final int left; // nechta qolgani

  // constuctor
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
