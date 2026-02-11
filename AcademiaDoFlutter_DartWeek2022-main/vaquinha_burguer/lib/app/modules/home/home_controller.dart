import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/core/services/auth_service.dart';
import 'package:vaquinha_burguer/app/core/services/shopping_card_service.dart';
import 'package:vaquinha_burguer/app/modules/menu/menu_bindings.dart';
import 'package:vaquinha_burguer/app/modules/menu/menu_page.dart';
import 'package:vaquinha_burguer/app/modules/order/shopping_card/shopping_card_bindings.dart';
import 'package:vaquinha_burguer/app/modules/order/shopping_card/shopping_card_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final ShoppingCardService _shoppingCardService;

  //variavel observavel, para controlar o tab index dinamicamente
  final _tabIndex = 0.obs;

  // varivel que identifica a pagina
  final _tabs = ['/menu', '/order/shopping_cart', '/exit'];

  HomeController({
    required ShoppingCardService shoppingCardService,
  }) : _shoppingCardService = shoppingCardService;

  //variavel para pegar a quantidade de produtos no carrinho
  int get totalProductsInShoppingCard => _shoppingCardService.totalProducts;

//seta a navegação
  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  int get tabIndex => _tabIndex.value;

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/order/shopping_cart') {
      return GetPageRoute(
        settings: settings,
        page: () => ShoppingCardPage(),
        binding: ShoppingCardBindings(),
        transition: Transition.fadeIn,
      );
    }
  }
}
