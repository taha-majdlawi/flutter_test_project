import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_project/core/utils/assets.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [CustomAppBar()]));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 17),
          child: Image.asset(AppAssets.drawer, width: 31, height: 30),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 107.0, top: 50),
          child: Image.asset(AppAssets.logo, width: 123, height: 123),
        ),

        Text('Oerder#')
      ],
    );
  }
}
