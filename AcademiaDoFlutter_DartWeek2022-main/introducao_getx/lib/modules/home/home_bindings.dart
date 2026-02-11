import 'package:get/get.dart';
import 'package:introducao_getx/modules/home/home_controller.dart';
import 'package:introducao_getx/modules/repository/produto_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProdutoRepository());
    Get.put(HomeController());
  }
}
