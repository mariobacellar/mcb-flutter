import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/core/rest_client/rest_client.dart';
import 'package:vaquinha_burguer/app/core/services/shopping_card_service.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    ); //mantem independente de sair ou nao da pagina, mantem a aplicação ativa

//Servico para utilizar na aplicação toda
    Get.lazyPut(() => ShoppingCardService());
  }
}
