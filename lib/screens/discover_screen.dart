import 'package:flutter/material.dart';
import '../data/mock_products.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock JSON verisini Product listesine çeviriyoruz
    final List<Product> products = getMockProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,       // Yan yana 2 ürün
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,  // Kart oranı: görsel + metin alanına uygun
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              product: product,
              onTap: () {
                // Route Arguments mantığı: veriyi doğrudan constructor'a
                // değil, ayrı bir route tanımıyla taşıyoruz.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductDetailScreen(),
                    settings: RouteSettings(arguments: product),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}