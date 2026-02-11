import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/modules/auth/register/register_controller.dart';
import 'package:vaquinha_burguer/app/repositories/auth/auth_repository.dart';
import 'package:vaquinha_burguer/app/repositories/auth/auth_repository_impl.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    //chama o backend
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(
            restClient: Get.find()) //recupera o rest(backend),
        );

    Get.lazyPut(
      () => RegisterController(authRepository: Get.find()),
    );
  }
}
