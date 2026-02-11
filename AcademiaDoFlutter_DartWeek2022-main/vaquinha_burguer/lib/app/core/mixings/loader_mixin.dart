import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  //controla o que vai acontecer
  void loaderListiner(RxBool loading) {
    //workers - escuta variaveis
    ever(loading, (_) async {
      // Se o loading for true ele abre o loading
      if (loading.isTrue) {
        await Get.dialog(
          // caso o usuario tente voltar, ou tentar bloquear o loading, nao permite o usuario sair da tela
          WillPopScope(
            onWillPop: () async => false,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          //bloqueia qualquer açao do usuario, impedindo de sumir o loading
          barrierDismissible: false,
        );
      } else {
        //senao fecha o loading
        Get.back();

        //obs: após a versão 5 do getx, sera utilizado o Get.close(); para fechar a snackbar
      }
    });
  }
}
