import 'package:flutter/material.dart';

// Ürün görselinin kaynağı network URL mi yoksa yerel asset mi olduğunu
// otomatik anlayıp doğru widget'ı (Image.network / Image.asset) seçer.
class ProductImage extends StatelessWidget {
  final String path;
  final BoxFit fit;

  const ProductImage({
    super.key,
    required this.path,
    this.fit = BoxFit.cover,
  });

  bool get _isLocalAsset => path.startsWith('assets/');

  @override
  Widget build(BuildContext context) {
    if (_isLocalAsset) {
      return Image.asset(
        path,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.image_not_supported_outlined,
                color: Colors.grey, size: 32),
          );
        },
      );
    }

    return Image.network(
      path,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(Icons.image_not_supported_outlined,
              color: Colors.grey, size: 32),
        );
      },
    );
  }
}