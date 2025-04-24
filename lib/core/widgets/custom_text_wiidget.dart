import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    required this.style,
    this.maxLine,
  });
  final String text;
  final TextStyle style;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
