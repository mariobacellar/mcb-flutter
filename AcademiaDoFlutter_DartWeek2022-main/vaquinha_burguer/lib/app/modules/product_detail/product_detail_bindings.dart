import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/modules/product_detail/product_detail_controller.dart';

class ProductDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ProductDetailController(shoppingCardService: Get.find()),
    );
  }
}
