import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;
  final double top;

  Color getColors(int index) {
    return index == currentIndex ? Colors.white70 : Colors.white38;
  }

  double getSize(int index) {
    return index == currentIndex ? 10 : 7;
  }

  const MyDotsApp({Key key, this.currentIndex, this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      top: top,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: getSize(0),
            width: getSize(0),
            decoration: BoxDecoration(
              color: getColors(0),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: getSize(1),
            width: getSize(1),
            decoration: BoxDecoration(
              color: getColors(1),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: getSize(2),
            width: getSize(2),
            decoration: BoxDecoration(
              color: getColors(2),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
