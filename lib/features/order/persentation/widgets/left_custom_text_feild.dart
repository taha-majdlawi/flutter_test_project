
import 'package:flutter/material.dart';

class LeftCustomTextFeild extends StatelessWidget {
  const LeftCustomTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff006B83),
                    width: 2,
                  ), // line color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff006B83),
                    width: 2,
                  ), // line on focus
                ),
                border: InputBorder.none, // removes border
              ),
            ),
          ),
        ),
      ],
    );
  }
}
