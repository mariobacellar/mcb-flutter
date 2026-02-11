import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaquinha_burguer/app/core/constants/constants.dart';
import 'package:vaquinha_burguer/app/core/mixings/loader_mixin.dart';
import 'package:vaquinha_burguer/app/core/mixings/messages_mixin.dart';
import 'package:vaquinha_burguer/app/core/rest_client/rest_client.dart';
import 'package:vaquinha_burguer/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController with LoaderMixin, MessageMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs; //variavel observavel

  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListiner(_loading);
    messageListener(_message);
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();

      final userLogged = await _authRepository.register(
        name,
        email,
        password,
      );
      GetStorage().write(Constants.USER_KEY, userLogged.id);

      _loading.toggle();

      // Get.back(); //volta para o login

      // _message(
      //   MessageModel(
      //     title: 'Sucesso',
      //     message: 'Cadastro Realizado Com Sucesso',
      //     type: MessageType.info,
      //   ),
      // );
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log('Erro ao Registrar Usuário', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: e.message,
        type: MessageType.error,
      ));
    } catch (e) {
      _message(MessageModel(
        title: 'Erro',
        message: 'Erro ao Registrar Usuário',
        type: MessageType.error,
      ));
    }
  }
}


//ele gerencia as instancias e dependencias