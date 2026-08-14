class ProductCategory {
  const ProductCategory({required this.slug, required this.name});

  final String slug;
  final String name;

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      slug: json['slug'] as String,
      name: json['name'] as String,
    );
  }
}
