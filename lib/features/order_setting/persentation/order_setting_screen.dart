import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/app_router.dart';
import 'package:flutter_test_project/core/utils/assets.dart';
import 'package:flutter_test_project/core/utils/styles.dart';
import 'package:flutter_test_project/core/widgets/custom_text_wiidget.dart';
import 'package:flutter_test_project/features/order/persentation/widgets/custom_app_bar.dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/custom_app_bar.dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/custom_order_info_left_side..dart';
import 'package:go_router/go_router.dart';

class OrderSettingScreen extends StatelessWidget {
  const OrderSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 44.0),
            child: CustomOrderSettingScreenAppBar(),
          ),
          Padding(padding: const EdgeInsets.all(20.0), child: OrderInfo()),
        ],
      ),
    );
  }
}

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

class OrderInfoRightSide extends StatelessWidget {
  const OrderInfoRightSide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: 'Order #', style: Styles.blueTextStyle16),
        SizedBox(height: 25),
        CustomTextWidget(text: 'Order Name', style: Styles.blueTextStyle16),
        SizedBox(height: 25),
        CustomTextWidget(text: 'Delivary Date', style: Styles.blueTextStyle16),
        SizedBox(height: 25),
        CustomTextWidget(text: 'Total Quantity', style: Styles.blueTextStyle16),
        SizedBox(height: 25),
        CustomTextWidget(
          text: 'Estimated Total',
          style: Styles.blueTextStyle16,
        ),
        SizedBox(height: 44),
        CustomTextWidget(text: 'Location', style: Styles.blueTextStyle16),
      ],
    );
  }
}
