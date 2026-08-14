import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entities/product.dart';
import '../entities/product_category.dart';

class ApiRepository {
  static const String baseUrl = 'http://192.168.1.157:3000';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final data = body['data'] as List<dynamic>;
    return data.map((item) => Product.fromJson(item)).toList();
  }

  // not used yet, was gonna add category filters if there was time
  Future<List<ProductCategory>> getCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final data = body['data'] as List<dynamic>;
    return data.map((item) => ProductCategory.fromJson(item)).toList();
  }
}
