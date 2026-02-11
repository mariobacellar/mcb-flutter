import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/core/services/auth_service.dart';

class SplashController extends GetxController {
  void checkedLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
