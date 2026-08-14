import 'package:flutter/material.dart';
import 'package:jabu_mobile/domain/entities/product.dart';
import 'package:jabu_mobile/domain/repositories/api_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiRepository api = ApiRepository();

  List<Product> productsResponse = [];
  bool loadingStatus = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      loadingStatus = true;
      _error = null;
    });
    try {
      final products = await api.getProducts();
      setState(() {
        productsResponse = products;
        loadingStatus = false;
      });
    } catch (exxception) {
      print(exxception);
      setState(() {
        _error = 'Something went wrong';
        loadingStatus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (loadingStatus) {
      return Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: _loadData,
              child: Text('Retry'),
            ),
          ],
        ),
      );
    }
    if (productsResponse.isEmpty) {
      return Center(child: Text('No products'));
    }
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: productsResponse.length,
      itemBuilder: (context, index) {
        final product = productsResponse[index];
        return Card(
          child: ListTile(
            leading: Image.network(
              product.imageUrl,
              width: 56,
              height: 56,
            ),
            title: Text('\$${product.price.toStringAsFixed(2)}'),
            subtitle: Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
            },
          ),
        );
      },
    );
  }
}
