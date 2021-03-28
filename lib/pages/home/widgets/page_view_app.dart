import 'package:flutter/material.dart';
import 'package:nubank_flutter/pages/home/widgets/card_app.dart';

class PageViewApp extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final double top;
  final GestureDragUpdateCallback onPanUpdate;
  final bool showMenu;

  const PageViewApp(
      {Key key, this.onChanged, this.top, this.onPanUpdate, this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeigth = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      top: top,
      height: _screenHeigth * .35,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
          onPageChanged: onChanged,
          // scrollDirection: Axis.vertical,
          physics: showMenu
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
          children: [
            CardApp(),
            CardApp(),
            CardApp(),
          ],
        ),
      ),
    );
  }
}
