import 'package:flutter_test_project/features/order/data/models/product.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'product_client.g.dart';

@RestApi(baseUrl: "https://app.giotheapp.com/api-sample/")
abstract class ProductClient {
  factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;
@GET("")
Future<Map<String, dynamic>> fetchRawProducts();
}
