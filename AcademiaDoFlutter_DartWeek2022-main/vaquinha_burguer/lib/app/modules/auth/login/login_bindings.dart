import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/modules/auth/login/login_controller.dart';
import 'package:vaquinha_burguer/app/repositories/auth/auth_repository.dart';
import 'package:vaquinha_burguer/app/repositories/auth/auth_repository_impl.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(
            restClient: Get.find()) //recupera o rest(backend),
        );

    Get.lazyPut(
      () => LoginController(authRepository: Get.find()),
    );
  }
}
