import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/icon_badge.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_appbar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VaquinhaAppbar(),
      //barra de navegação que fica no footer do app
      // a bottom navigator esta dentro de um obx, pois é necessario para a variavel de observação funcionanar
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: IconBadge(
                number: controller.totalProductsInShoppingCard,
                icon: Icons.shopping_cart,
              ),
              label: 'Carrinho',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.door_back_door),
              label: 'Sair',
            ),
          ],
        );
      }),
      ///////////////////////////////
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
  }
}
