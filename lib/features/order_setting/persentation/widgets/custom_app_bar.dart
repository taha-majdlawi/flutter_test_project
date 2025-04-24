
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/assets.dart';

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
                padding: const EdgeInsets.only(left: 128.0, top: 50),
                child: Image.asset(AppAssets.logo, width: 123, height: 80),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Image.asset(AppAssets.arrow_back, width: 24, height: 24),
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
