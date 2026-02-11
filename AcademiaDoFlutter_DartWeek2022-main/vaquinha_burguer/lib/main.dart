import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaquinha_burguer/app/core/bindings/application_bindings.dart';
import 'package:vaquinha_burguer/app/core/ui/vaquinha_uI.dart';
import 'package:vaquinha_burguer/app/routes/auth_routers.dart';
import 'package:vaquinha_burguer/app/routes/home_routers.dart';
import 'package:vaquinha_burguer/app/routes/orders_routers.dart';
import 'package:vaquinha_burguer/app/routes/product_routers.dart';
import 'package:vaquinha_burguer/app/routes/splash_routers.dart';

//foi alterado a função inicial, para o getstorage, aguardar a incialização
Future<void> main() async {
  await GetStorage.init();
  runApp(const VaquinhaBurguerMainApp());
}

class VaquinhaBurguerMainApp extends StatelessWidget {
  const VaquinhaBurguerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Vaquinha Burguer',
      theme: VaquinhaUI.theme,
      initialBinding:
          ApplicationBinding(), //mantem a aplicação ativa, mesmo ao mudar de pagina
      getPages: [
        //os ... significa que ele vai destruir o array e construi-lo em um novo
        //Destructor
        ...AuthRouters.routers,
        ...SplashRoutes.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
        ...OrdersRouters.routers,
      ],
    );
  }
}
