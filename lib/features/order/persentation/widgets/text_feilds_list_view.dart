import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/order/persentation/widgets/cutsom_text_feild.dart';

class TextFeildsListView extends StatelessWidget {
  const TextFeildsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) => CustomTextFeilds(index: index,),
      ),
    );
  }
}
