import '../models/product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;
}

class CartManager {
  CartManager._privateConstructor();
  static final CartManager instance = CartManager._privateConstructor();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItemCount =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.totalPrice);

  void addProduct(Product product) {
    final existingIndex =
        _items.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
  }

  void removeProduct(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
  }
}