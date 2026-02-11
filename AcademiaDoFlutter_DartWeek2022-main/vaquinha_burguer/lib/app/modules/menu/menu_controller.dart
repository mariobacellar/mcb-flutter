import 'dart:developer';

import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/core/mixings/loader_mixin.dart';
import 'package:vaquinha_burguer/app/core/mixings/messages_mixin.dart';
import 'package:vaquinha_burguer/app/models/product_model.dart';

import 'package:vaquinha_burguer/app/repositories/products/product_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessageMixin {
  final ProductRepository _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({required ProductRepository productRepository})
      : _productRepository = productRepository;
  @override
  void onInit() {
    super.onInit();
    loaderListiner(_loading);
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } on Exception catch (e, s) {
      _loading.toggle();
      log(
        'Erro ao Buscar Produtos',
        error: e,
        stackTrace: s,
      );
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao Buscar Menu',
            type: MessageType.error),
      );
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products); //sobrescreve uma lista
  }

  Future<void> refreshPage() async {
    try {
      await findAllProducts();
    } on Exception catch (e, s) {
      log(
        'Erro ao Buscar Produtos',
        error: e,
        stackTrace: s,
      );
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao Buscar Menu',
            type: MessageType.error),
      );
    }
  }
}
