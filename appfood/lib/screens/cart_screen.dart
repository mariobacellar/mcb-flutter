import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartScreen({super.key, this.cartItems = const []});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'];
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: cartItems.isEmpty
          ? const Center(child: Text('Seu carrinho está vazio 😅'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        title: Text(item['name']),
                        subtitle: Text('R\$ ${item['price'].toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Total: R\$ ${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        child: const Text('Finalizar Pedido'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
