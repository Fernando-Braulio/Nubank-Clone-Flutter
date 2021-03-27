import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;

  Color getColors(int index) {
    return index == currentIndex ? Colors.white70 : Colors.white38;
  }

  double getSize(int index) {
    return index == currentIndex ? 10 : 7;
  }

  const MyDotsApp({Key key, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: getSize(0),
          width: getSize(0),
          decoration: BoxDecoration(
            color: getColors(0),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Container(
          height: getSize(1),
          width: getSize(1),
          decoration: BoxDecoration(
            color: getColors(1),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Container(
          height: getSize(2),
          width: getSize(2),
          decoration: BoxDecoration(
            color: getColors(2),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
