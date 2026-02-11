import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaquinha_burguer/app/core/constants/constants.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      // if (isLoged != null) {
      //   isLoged(true);
      // } else {
      //   isLoged(false);
      // }
      _isLogged(value != null);
    });

    //lógica de navegação
    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });

    //final isLoggedData = getUserId() != null;
    _isLogged(getUserId() != null);
    //
    //retorna a propria instancia
    return this;
  }

  void logout() =>
      _getStorage.write(Constants.USER_KEY, null); //desloga o usuario

  int? getUserId() =>
      _getStorage.read(Constants.USER_KEY); //pega o id do usuario

}
