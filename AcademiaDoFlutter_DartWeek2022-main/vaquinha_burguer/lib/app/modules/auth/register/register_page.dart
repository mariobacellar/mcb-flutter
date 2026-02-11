import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vaquinha_burguer/app/core/ui/vaquinha_state.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_appbar.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_button.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_textformfield.dart';
import 'package:vaquinha_burguer/app/modules/auth/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VaquinhaState<RegisterPage, RegisterController> {
//controladores de formularios
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _nameEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VaquinhaAppbar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Form(
              key: _formKey, //chave do formulario
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Text('Preencha os campos abaixo para criar o seu cadastro.',
                      style: context.textTheme.bodyText1),
                  const SizedBox(
                    height: 30,
                  ),
                  VaquinhaTextformfield(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigatório'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VaquinhaTextformfield(
                    label: 'E-mail',
                    controller: _emailEC,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validatorless.multiple([
                      Validatorless.required('Email Obrigatório'),
                      Validatorless.email('Email Inválido'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VaquinhaTextformfield(
                      label: 'Senha',
                      obscureText: true,
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha Obrigatória'),
                        Validatorless.min(
                          6,
                          'Senha Deve Conter Pelo Menos 6 Caracteres',
                        ),
                      ])),
                  const SizedBox(
                    height: 30,
                  ),
                  VaquinhaTextformfield(
                      label: 'Confirma Senha',
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Confirma Senha Obrigatório'),
                        Validatorless.compare(
                          _passwordEC,
                          'Senha Diferente de Confirma Senha',
                        ),
                      ])),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: VaquinhaButton(
                      label: 'Cadastrar',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          controller.register(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text,
                          );
                        }
                      },
                      width: context.width,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
