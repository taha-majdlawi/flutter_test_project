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
          text: 'TAHA MAJDLAWI',
          style: Styles.blueTextStyle16,
        ),
        const SizedBox(height: 25),
        const CustomTextWidget(
          text: 'May 4th 2025',
          style: Styles.blueTextStyle16,
        ),
        const SizedBox(height: 25),
        const CustomTextWidget(text: '38', style: Styles.blueTextStyle16),
        const SizedBox(height: 25),
        const CustomTextWidget(text: '1402.96', style: Styles.blueTextStyle16),
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
