import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/assets.dart';
import 'package:flutter_test_project/core/widgets/order_number_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Image.asset(AppAssets.drawer, width: 31, height: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 95.0, top: 50),
                child: Image.asset(AppAssets.logo, width: 123, height: 80),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Image.asset(AppAssets.cancel, width: 24, height: 24),
              ),
              Image.asset(AppAssets.arrow_forword, width: 24, height: 24),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomOrderNumberText(orderNumber: 112096),
          ),
        ],
      ),
    );
  }
}
