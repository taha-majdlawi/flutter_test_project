import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        height: 51,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff006B83),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // 👈 Border radius here
            ),
          ),
          onPressed: () {},
          child: const Text('Submit', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
