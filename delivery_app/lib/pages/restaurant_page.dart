// ============================================
// ARQUIVO 9: lib/pages/restaurant_page.dart
// ============================================
import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../widgets/product_card.dart';

class RestaurantPage extends StatelessWidget {
  final Restaurant restaurant;
  final List<CartItem> cart;
  final VoidCallback onUpdateCart;

  const RestaurantPage({
    super.key,
    required this.restaurant,
    required this.cart,
    required this.onUpdateCart,
  });

  void addToCart(Product product, BuildContext context) {
    final existingItemIndex = cart.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex >= 0) {
      cart[existingItemIndex].quantity++;
    } else {
      cart.add(CartItem(product: product));
    }
    
    onUpdateCart();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} adicionado ao carrinho'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      restaurant.image,
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        restaurant.category,
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.orange),
                          const SizedBox(width: 4),
                          Text('${restaurant.rating}'),
                          const SizedBox(width: 12),
                          const Icon(Icons.access_time, size: 16),
                          const SizedBox(width: 4),
                          Text(restaurant.deliveryTime),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text(
                  'Cardápio',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${restaurant.products.length} itens)',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: restaurant.products.length,
              itemBuilder: (context, index) {
                final product = restaurant.products[index];
                return ProductCard(
                  product: product,
                  onAdd: () => addToCart(product, context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
