import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/order_setting_screen_body.dart';


class OrderSettingScreen extends StatelessWidget {
  const OrderSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderSettingScreenBody(),
    );
  }
}