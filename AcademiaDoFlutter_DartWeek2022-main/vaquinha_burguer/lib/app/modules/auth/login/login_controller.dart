import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaquinha_burguer/app/core/constants/constants.dart';
import 'package:vaquinha_burguer/app/core/exceptions/user_notfound_exception.dart';
import 'package:vaquinha_burguer/app/core/mixings/loader_mixin.dart';
import 'package:vaquinha_burguer/app/core/mixings/messages_mixin.dart';
import 'package:vaquinha_burguer/app/repositories/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final AuthRepository _authRepository;

  //variaveis de mixing, observação

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();

    loaderListiner(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    //inicia o loading
    try {
      _loading.toggle();

      final userLogged = await _authRepository.login(email, password);

      //se o login for efetuado com sucesso, será armazenado os dados do usuario

      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);
      //tira o loading
      _loading.toggle();
    } on UserNotFoundException catch (e, s) {
      _loading.toggle();
      log('Login ou Senha Inválidos', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Login ou Senha Inválidos',
            type: MessageType.error),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao Realizar o Login', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao Realizar o Login',
            type: MessageType.error),
      );
    }
  }
}
