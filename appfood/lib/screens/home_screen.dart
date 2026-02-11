import 'package:flutter/material.dart';
import 'restaurant_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> restaurants = const [
    {'name': 'Pizzaria Bella Napoli', 'image': 'https://picsum.photos/200?1'},
    {'name': 'Sushi Master', 'image': 'https://picsum.photos/200?2'},
    {'name': 'Churrasco do Zé', 'image': 'https://picsum.photos/200?3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final r = restaurants[index];
          return ListTile(
            leading: Image.network(r['image'], width: 60, fit: BoxFit.cover),
            title: Text(r['name']),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantScreen(restaurant: r),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
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
