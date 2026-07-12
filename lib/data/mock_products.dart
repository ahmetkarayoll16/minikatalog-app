import '../models/product_model.dart';
final List<Map<String, dynamic>> mockProductsJson = [
  {
    "id": 1,
    "title": "Essence Mascara Lash Princess",
    "description": "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects.",
    "price": 9.99,
    "discountPercentage": 7.17,
    "rating": 4.94,
    "stock": 5,
    "brand": "Essence",
    "category": "beauty",
    "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
    "images": [
      "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"
    ]
  },
  {
    "id": 2,
    "title": "Eyeshadow Palette with Mirror",
    "description": "The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks.",
    "price": 19.99,
    "discountPercentage": 5.5,
    "rating": 3.28,
    "stock": 44,
    "brand": "Glamour Beauty",
    "category": "beauty",
    "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png",
    "images": [
      "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/1.png"
    ]
  },
  {
    "id": 3,
    "title": "Powder Canister",
    "description": "The Powder Canister is a finely milled setting powder designed to set makeup and control shine.",
    "price": 14.99,
    "discountPercentage": 18.14,
    "rating": 4.61,
    "stock": 55,
    "brand": "Velvet Touch",
    "category": "beauty",
    "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/thumbnail.png",
    "images": [
      "https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/1.png"
    ]
  },
  {
    "id": 4,
    "title": "Red Nail Polish",
    "description": "Red Nail Polish is a classic and versatile beauty product that adds a touch of color to your nails.",
    "price": 8.99,
    "discountPercentage": 10.23,
    "rating": 4.11,
    "stock": 35,
    "brand": "Chic Cosmetics",
    "category": "beauty",
    "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/thumbnail.png",
    "images": [
      "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/1.png"
    ]
  },
{
    "id": 5,
    "title": "iPhone 14",
    "description": "An apple mobile which is nothing like apple, featuring a stunning display and powerful camera.",
    "price": 549.0,
    "thumbnail": "assets/images/iphone14.jpg",
    "images": [
      "https://placehold.co/400x400/6750A4/FFFFFF?text=iPhone+14"
    ]
  },
  {
    "id": 6,
    "title": "iPhone 17",
    "description": "SIM-Free, 6.5-inch Super Retina HD display with OLED technology and A12 Bionic chip.",
    "price": 899.0,
    "thumbnail": "assets/images/iphone17.jpg",
    "images": [
      "https://placehold.co/400x400/6750A4/FFFFFF?text=iPhone+17"
    ]
  },
];

// JSON listesini doğrudan Product nesnelerine çeviren yardımcı fonksiyon
List<Product> getMockProducts() {
  return mockProductsJson.map((json) => Product.fromJson(json)).toList();
}