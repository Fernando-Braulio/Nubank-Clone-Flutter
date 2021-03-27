import 'package:flutter/material.dart';
import 'package:nubank_flutter/pages/home/widgets/card_app.dart';

class PageViewApp extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final double top;

  const PageViewApp({Key key, this.onChanged, this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeigth = MediaQuery.of(context).size.height;

    return Positioned(
      top: top,
      height: _screenHeigth * .35,
      left: 0,
      right: 0,
      child: PageView(
        onPageChanged: onChanged,
        // scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          CardApp(),
          CardApp(),
          CardApp(),
        ],
      ),
    );
  }
}
