
import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/order/persentation/widgets/custom_app_bar.dart';
import 'package:flutter_test_project/features/order/persentation/widgets/text_feilds_list_view.dart';

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [CustomAppBar(), Expanded(child: TextFeildsListView())],
    );
  }
}
