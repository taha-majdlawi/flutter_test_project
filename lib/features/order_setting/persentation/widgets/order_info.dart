
import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/custom_order_info_left_side..dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/custom_order_info_right_side.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OrderInfoLeftSide(),
        const SizedBox(width: 30),
        OrderInfoRightSide(),
      ],
    );
  }
}
