import 'package:flutter/material.dart';

class CustomVerticalLines extends StatelessWidget {
  const CustomVerticalLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(15, (index) {
          return Container(width: 1, color: Colors.black.withOpacity(0.12));
        }),
      ),
    );
  }
}
