import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/styles.dart';
import 'package:flutter_test_project/core/widgets/custom_text_wiidget.dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/custom_app_bar.dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/custom_elevated_button.dart';
import 'package:flutter_test_project/features/order_setting/persentation/widgets/order_info.dart';

class OrderSettingScreenBody extends StatelessWidget {
  const OrderSettingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 44.0),
          child: CustomOrderSettingScreenAppBar(),
        ),
        Padding(padding: const EdgeInsets.all(20.0), child: OrderInfo()),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: const CustomTextWidget(
            text: 'Delivery instructions ...',
            style: Styles.blueTextStyle16,
          ),
        ),
        CustomElevatedButton(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: const CustomTextWidget(
            text: 'Save as draft',
            style: Styles.blueTextStyle16,
          ),
        ),
      ],
    );
  }
}
