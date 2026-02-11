import 'package:flutter/material.dart';
import 'cart_screen.dart';

class RestaurantScreen extends StatefulWidget {
  final Map<String, dynamic> restaurant;

  const RestaurantScreen({super.key, required this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final List<Map<String, dynamic>> menu = [
    {'name': 'Pizza Calabresa', 'price': 39.90},
    {'name': 'Pizza Margherita', 'price': 34.90},
    {'name': 'Pizza Portuguesa', 'price': 42.50},
  ];

  final List<Map<String, dynamic>> cart = [];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cart.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant['name']),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(cartItems: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          final item = menu[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text('R\$ ${item['price'].toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () => addToCart(item),
              child: const Text('Adicionar'),
            ),
          );
        },
      ),
    );
  }
}
