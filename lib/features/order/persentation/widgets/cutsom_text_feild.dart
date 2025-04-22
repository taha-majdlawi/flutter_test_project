import 'package:flutter/material.dart';

class CustomTextFeilds extends StatelessWidget {
  const CustomTextFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xff006B83), width: 1),
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff006B83), width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff006B83), width: 1),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff006B83), width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff006B83), width: 1),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
