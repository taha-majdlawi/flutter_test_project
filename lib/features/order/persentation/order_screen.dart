import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_project/core/utils/assets.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Column(children: [CustomAppBar()])));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Row(
        children: [
          Image.asset(AppAssets.drawer, width: 24, height: 24),
          Image.asset(AppAssets.logo, width: 24, height: 24),
        ],
      ),
    );
  }
}
