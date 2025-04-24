import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/app_router.dart';
import 'package:flutter_test_project/features/order/persentation/order_screen.dart';

void main() {
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
