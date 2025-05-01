import 'package:flutter_test_project/features/order/data/models/product.dart';
import 'package:flutter_test_project/features/order/data/repos/product_client.dart';

class ProductClintImplemnt {
  final ProductClient productClient;

  ProductClintImplemnt({required this.productClient});

  Future<List<Product>> getProducts() async {
    final Map<String, dynamic> data = await productClient.fetchRawProducts();

    final List<Product> products =
        data.entries
            .map(
              (entry) => Product(id: entry.key, name: entry.value.toString()),
            )
            .toList();
   for(Product product in products){
     print(product.name);
   }
    return products;
  }
}
