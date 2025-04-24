import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/order/persentation/order_screen.dart';
import 'package:flutter_test_project/features/order_setting/persentation/order_setting_screen.dart';

// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOrderSettingScreen = '/OrderSettingScreen';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const OrderScreen();
        },
      ),
      GoRoute(
        path: kOrderSettingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OrderSettingScreen();
        },
      ),
    ],
  );
}
