class Product {
  const Product({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  final int id;
  final String description;
  final String imageUrl;
  final double price;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
}
