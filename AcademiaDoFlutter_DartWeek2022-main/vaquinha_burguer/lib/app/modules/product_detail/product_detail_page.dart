import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vaquinha_burguer/app/core/ui/formatter_help.dart';
import 'package:vaquinha_burguer/app/core/ui/vaquinha_uI.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/plus_minus_button.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_appbar.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_button.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VaquinhaAppbar(),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.width,
                  height: context.heightTransformer(reducedBy: 60),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://dartweek.academiadoflutter.com.br/images${controller.product.image}'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    controller.product.name,
                    style: context.textTheme.headline4!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    controller.product.description,
                    style: context.textTheme.bodyText2!,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return PlusMinusButton(
                    minusCallBack: controller.removeProduct,
                    plusCallBack: controller.addProduct,
                    price: controller.product.price,
                    quantity: controller.quantity,
                  );
                }),
                const Divider(),
                ListTile(
                  title: const Text(
                    'Total',
                    style: VaquinhaUI.textBold,
                  ),
                  trailing: Obx(() {
                    return Text(
                      FormatterHelp.formatCurrency(controller.totalPrice),
                      style: VaquinhaUI.textBold,
                    );
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: context.widthTransformer(reducedBy: 10),
                    child: VaquinhaButton(
                      label:
                          controller.alreadyAdded ? 'ATUALIZAR' : 'ADICIONAR',
                      onPressed: controller.addProductInShoppingCard,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
