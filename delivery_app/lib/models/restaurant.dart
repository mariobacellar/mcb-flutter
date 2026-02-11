// ============================================
// ARQUIVO 3: lib/models/restaurant.dart
// ============================================
import 'product.dart';

class Restaurant {
  final int id;
  final String name;
  final String category;
  final double rating;
  final String deliveryTime;
  final double deliveryFee;
  final String image;
  final List<Product> products;

  Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.image,
    required this.products,
  });
}
