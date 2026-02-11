import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introducao_getx/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.adicionarProdutos,
      ),
      body: Obx(() {
        //tem que utilizar o obx para atualizar a tela
        return ListView.builder(
            itemCount: controller.produtos.length,
            itemBuilder: (context, index) {
              final produto = controller.produtos[index];
              return ListTile(
                onTap: () {
                  Get.toNamed('/produto', arguments: produto);
                },
                title: Text(produto),
              );
            });
      }),
    );
  }
}
