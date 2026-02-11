import 'package:get/get.dart';
import 'package:introducao_getx/modules/repository/produto_repository.dart';

class HomeController extends GetxController {
  final produtos = <String>[].obs;
  final _produtoRepository = Get.find<ProdutoRepository>();

  @override
  void onInit() {
    ever(produtos, (produtosEstado) {
      print('Produtos foi Alterado $produtosEstado');
    });
    super.onInit();
  }

  @override
  void onReady() {
    final produtosData = _produtoRepository.recuperarProdutos();

    produtos.assignAll(produtosData);
    super.onReady();
  }

  void adicionarProdutos() {
    produtos.add('Arquiteto Flutter');
  }
}
