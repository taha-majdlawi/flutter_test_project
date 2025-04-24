import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/utils/styles.dart';
import 'package:flutter_test_project/core/widgets/custom_text_wiidget.dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/custom_app_bar.dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/order_info.dart';
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