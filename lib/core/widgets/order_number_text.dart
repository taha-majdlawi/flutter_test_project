import 'package:flutter/material.dart';

class CustomOrderNumberText extends StatelessWidget {
  const CustomOrderNumberText({super.key, required this.orderNumber});
  final int orderNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Order# ',
          style: TextStyle(
            color: Color(0xff5000B9),
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: 'Public Sans',
          ),
        ),
        Text(
          '$orderNumber',
          style: TextStyle(
            color: Color(0xff006B83),
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: 'Public Sans',
          ),
        ),
      ],
    );
  }
}
