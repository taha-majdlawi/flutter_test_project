import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_project/core/utils/assets.dart';
import 'package:flutter_test_project/core/widgets/order_number_text.dart';
import 'package:flutter_test_project/features/order/persentation/widgets/custom_app_bar.dart';
import 'package:flutter_test_project/features/order/persentation/widgets/left_custom_text_feild.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [CustomAppBar(), LeftCustomTextFeild()]),
    );
  }
}
