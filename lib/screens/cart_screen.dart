import 'package:flutter/material.dart';
import '../data/cart_manager.dart';
import '../widgets/product_image.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _refresh() {
    setState(() {});
  }

  void _increaseQuantity(int productId) {
    final item = CartManager.instance.items
        .firstWhere((item) => item.product.id == productId);
    setState(() {
      item.quantity++;
    });
  }

  void _decreaseQuantity(int productId) {
    final item = CartManager.instance.items
        .firstWhere((item) => item.product.id == productId);
    if (item.quantity > 1) {
      setState(() {
        item.quantity--;
      });
    } else {
      CartManager.instance.removeProduct(productId);
      _refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.instance.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
      ),
      body: cartItems.isEmpty
          ? _buildEmptyState()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                width: 64,
                                height: 64,
                                child: ProductImage(path: item.product.thumbnail),
                              ), 
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.product.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${item.product.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                        Icons.remove_circle_outline),
                                    onPressed: () =>
                                        _decreaseQuantity(item.product.id),
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  IconButton(
                                    icon:
                                        const Icon(Icons.add_circle_outline),
                                    onPressed: () =>
                                        _increaseQuantity(item.product.id),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline,
                                    color: Colors.red),
                                onPressed: () {
                                  CartManager.instance
                                      .removeProduct(item.product.id);
                                  _refresh();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                _buildTotalBar(),
              ],
            ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            'Sepetiniz boş',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalBar() {
    final total = CartManager.instance.totalPrice;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Toplam', style: TextStyle(color: Colors.grey)),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: total > 0
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Satın alma işlemi simüle edildi 🎉'),
                      ),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            child: const Text('Satın Al'),
          ),
        ],
      ),
    );
  }
}