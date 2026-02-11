import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vaquinha_burguer/app/core/ui/vaquinha_state.dart';
import 'package:vaquinha_burguer/app/core/ui/vaquinha_uI.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_appbar.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_button.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_textformfield.dart';
import 'package:vaquinha_burguer/app/modules/auth/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends VaquinhaState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VaquinhaAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        VaquinhaTextformfield(
                          label: 'E-mail',
                          controller: _emailEC,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validatorless.multiple([
                            Validatorless.email('Email Inválido'),
                            Validatorless.required('Email Obrigatório'),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        VaquinhaTextformfield(
                            label: 'Senha',
                            controller: _passwordEC,
                            obscureText: true,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha Obrigatória'),
                              Validatorless.min(6,
                                  'Senha Deve Conter Pelo Menos 6 caracteres'),
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: VaquinhaButton(
                            label: 'Entrar',
                            onPressed: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;

                              if (formValid) {
                                controller.login(
                                  email: _emailEC.text,
                                  password: _passwordEC.text,
                                );
                              }
                            },
                            width: context.width,
                          ),
                        ),
                        const Spacer(), //tudo abaixo deste componente irá empurrar para baixo
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não possui uma conta?'),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/auth/register');
                              },
                              child: const Text(
                                'Cadastre-se',
                                style: VaquinhaUI.textBold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
