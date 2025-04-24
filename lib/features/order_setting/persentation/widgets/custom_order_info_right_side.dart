
import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/styles.dart';
import 'package:flutter_test_project/core/widgets/custom_text_wiidget.dart';

class OrderInfoRightSide extends StatelessWidget {
  const OrderInfoRightSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(text: '122096', style: Styles.blueTextStyle16),
        const SizedBox(height: 25),
        const CustomTextWidget(
          text: 'Order Name',
          style: Styles.blueTextStyle16,
        ),
        const SizedBox(height: 25),
        const CustomTextWidget(
          text: 'Delivary Date',
          style: Styles.blueTextStyle16,
        ),
        const SizedBox(height: 25),
        const CustomTextWidget(
          text: 'Total Quantity',
          style: Styles.blueTextStyle16,
        ),
        const SizedBox(height: 25),
        const CustomTextWidget(
          text: 'Estimated Total',
          style: Styles.blueTextStyle16,
        ),
        const SizedBox(height: 44),

        const CustomTextWidget(
          maxLine: 1,
          text: '355 Onderdonk St\nMarina Dubai, UAE',
          style: Styles.blueTextStyle16,
        ),
      ],
    );
  }
}