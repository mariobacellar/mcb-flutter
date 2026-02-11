import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introducao_getx/modules/produto/produto_controller.dart';

class ProdutoPage extends GetView<ProdutoController> {
  const ProdutoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produto Page'),
      ),
      body: Center(
        child: Text(Get.arguments),
      ),
    );
  }
}
