import 'package:flutter/material.dart';
import 'package:nubank_flutter/pages/home/widgets/my_app_bar.dart';
import 'package:nubank_flutter/pages/home/widgets/my_dots_app.dart';
import 'package:nubank_flutter/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeigth = MediaQuery.of(context).size.height;
    if (_yPosition == null) {
      _yPosition = _screenHeigth * .24;
    }

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _screenHeigth * .80 : _screenHeigth * .24;
              });
            },
          ),
          PageViewApp(
            top: _yPosition,
            showMenu: _showMenu,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionButtonLimit = _screenHeigth * .80;
              double positionTopLimit = _screenHeigth * .24;
              double midlePosition = positionButtonLimit - positionTopLimit;
              midlePosition = midlePosition / 2;

              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionButtonLimit
                    ? positionButtonLimit
                    : _yPosition;

                if (_yPosition != positionButtonLimit && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition > positionTopLimit + midlePosition - 50
                          ? positionButtonLimit
                          : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition =
                      _yPosition < positionButtonLimit - midlePosition - 50
                          ? positionTopLimit
                          : _yPosition;
                }

                if (_yPosition == positionButtonLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDotsApp(
            top: !_showMenu ? _screenHeigth * .60 : _screenHeigth * 1.1,
            currentIndex: _currentIndex,
          ),
        ],
      ),
    );
  }
}
