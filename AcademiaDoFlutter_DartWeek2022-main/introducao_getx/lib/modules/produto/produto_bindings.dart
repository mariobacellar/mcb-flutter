import 'package:get/get.dart';
import './produto_controller.dart';

class ProdutoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProdutoController());
  }
}
