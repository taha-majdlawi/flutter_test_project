import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/app_router.dart';
import 'package:flutter_test_project/features/order/data/repos/product_client.dart';
import 'package:flutter_test_project/features/order/data/repos/product_clint_implemnt.dart';
import 'package:flutter_test_project/features/order/persentation/order_screen.dart';

void main() {
  ProductClintImplemnt productClient = ProductClintImplemnt(productClient: ProductClient(Dio(),baseUrl: 'https://app.giotheapp.com/api-sample/'));
  productClient.getProducts(); 
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),

      routerConfig: AppRouter.router,
    );
  }
}




