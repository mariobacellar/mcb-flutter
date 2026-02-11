// ============================================
// ARQUIVO 5: lib/data/restaurants_data.dart
// ============================================
import '../models/restaurant.dart';
import '../models/product.dart';

final List<Restaurant> restaurantsData = [
  Restaurant(
    id: 1,
    name: 'Burger Master',
    category: 'Hamburgueria',
    rating: 4.8,
    deliveryTime: '25-35 min',
    deliveryFee: 5.90,
    image: '🍔',
    products: [
      Product(
        id: 1,
        name: 'Burger Clássico',
        price: 25.90,
        description: 'Hambúrguer, queijo, alface, tomate',
        image: '🍔',
      ),
      Product(
        id: 2,
        name: 'Burger Bacon',
        price: 29.90,
        description: 'Hambúrguer, bacon, queijo cheddar',
        image: '🍔',
      ),
      Product(
        id: 3,
        name: 'Batata Frita',
        price: 12.90,
        description: 'Porção de batata crocante',
        image: '🍟',
      ),
      Product(
        id: 4,
        name: 'Refrigerante',
        price: 6.90,
        description: 'Lata 350ml',
        image: '🥤',
      ),
    ],
  ),
  Restaurant(
    id: 2,
    name: 'Pizza Bella',
    category: 'Pizzaria',
    rating: 4.6,
    deliveryTime: '40-50 min',
    deliveryFee: 7.50,
    image: '🍕',
    products: [
      Product(
        id: 5,
        name: 'Pizza Margherita',
        price: 42.90,
        description: 'Molho, mussarela, tomate, manjericão',
        image: '🍕',
      ),
      Product(
        id: 6,
        name: 'Pizza Calabresa',
        price: 45.90,
        description: 'Molho, mussarela, calabresa, cebola',
        image: '🍕',
      ),
      Product(
        id: 7,
        name: 'Pizza 4 Queijos',
        price: 48.90,
        description: 'Mussarela, gorgonzola, parmesão, provolone',
        image: '🍕',
      ),
    ],
  ),
  Restaurant(
    id: 3,
    name: 'Sushi House',
    category: 'Japonesa',
    rating: 4.9,
    deliveryTime: '35-45 min',
    deliveryFee: 6.90,
    image: '🍣',
    products: [
      Product(
        id: 9,
        name: 'Combinado 20 peças',
        price: 65.90,
        description: 'Sushis e sashimis variados',
        image: '🍣',
      ),
      Product(
        id: 10,
        name: 'Hot Roll',
        price: 32.90,
        description: '8 unidades empanadas',
        image: '🍱',
      ),
    ],
  ),
  Restaurant(
    id: 4,
    name: 'Açaí Premium',
    category: 'Sobremesas',
    rating: 4.7,
    deliveryTime: '20-30 min',
    deliveryFee: 4.50,
    image: '🍨',
    products: [
      Product(
        id: 12,
        name: 'Açaí 300ml',
        price: 15.90,
        description: 'Com 3 acompanhamentos',
        image: '🍨',
      ),
      Product(
        id: 13,
        name: 'Açaí 500ml',
        price: 22.90,
        description: 'Com 5 acompanhamentos',
        image: '🍨',
      ),
    ],
  ),
];
