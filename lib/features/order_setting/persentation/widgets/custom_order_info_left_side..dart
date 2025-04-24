import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/styles.dart';
import 'package:flutter_test_project/core/widgets/custom_text_wiidget.dart';

class OrderInfoLeftSide extends StatelessWidget {
  const OrderInfoLeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: 'Order #', style: Styles.textStyle16),
        SizedBox(height: 25),
        CustomTextWidget(text: 'Order Name', style: Styles.textStyle16),
        SizedBox(height: 25),
        CustomTextWidget(text: 'Delivary Date', style: Styles.textStyle16),
        SizedBox(height: 25),
        CustomTextWidget(text: 'Total Quantity', style: Styles.textStyle16),
        SizedBox(height: 25),
        CustomTextWidget(text: 'Estimated Total', style: Styles.textStyle16),
        SizedBox(height: 44),
        CustomTextWidget(text: 'Location', style: Styles.textStyle16),
      ],
    );
  }
}
