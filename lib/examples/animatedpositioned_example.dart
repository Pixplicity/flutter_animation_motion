import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  @override
  _AnimatedPositionedExampleState createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  var _left;
  var _top;

  var _tapped = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _left = MediaQuery.of(context).size.width - 80;
    _top = MediaQuery.of(context).size.height - 80;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeStateOnTap,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 1500),
            curve: Curves.fastOutSlowIn,
            left: _left,
            top: _top,
            child: Icon(
              Icons.favorite,
              size: 60.0,
              color: Colors.pink[400],
            ),
          )
        ],
      ),
    );
  }

  void _changeStateOnTap() => setState(() {
        _tapped = !_tapped;
        if (_tapped) {
          _left = 20.0;
          _top = 40.0;
        } else {
          _left = MediaQuery.of(context).size.width - 80;
          _top = MediaQuery.of(context).size.height - 80;
        }
      });
}
