import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/app_router.dart';
import 'package:flutter_test_project/core/utils/assets.dart';
import 'package:flutter_test_project/features/order/persentation/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

class OrderSettingScreen extends StatelessWidget {
  const OrderSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [CustomAppBar(), OrderInfo()]));
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OrderInfoLeftSide(),
      ],
    );
  }
}


class OrderInfoLeftSide extends StatelessWidget {
  const OrderInfoLeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [

          ],
        );;
  }
}