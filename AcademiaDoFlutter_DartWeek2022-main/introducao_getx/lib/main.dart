import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introducao_getx/modules/home/home_bindings.dart';
import 'package:introducao_getx/modules/home/home_page.dart';

import 'modules/produto/produto_bindings.dart';
import 'modules/produto/produto_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        //rotas da aplicação
        GetPage(
          name: '/',
          binding:
              HomeBinding(), //intermediario, que inclui todas dependencias que a pagina precisa
          page: () => HomePage(),
        ),
        GetPage(
          name: '/produto',
          binding:
              ProdutoBindings(), //intermediario, que inclui todas dependencias que a pagina precisa
          page: () => ProdutoPage(),
        ),
      ],
    );
  }
}
