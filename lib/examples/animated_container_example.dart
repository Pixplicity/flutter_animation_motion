import 'package:flutter/material.dart';

///
/// Animating changes in container's properties using AnimatedContainer
///
class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  var _width = 50.0;
  var _height = 50.0;
  var _borderRadius = 0.0;
  var _color = Colors.blue[400];
  var _tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _changeStateOnTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          curve: Curves.elasticOut,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
        ),
      ),
    );
  }

  void _changeStateOnTap() {
    setState(() {
      _tapCount++;
      if (_tapCount == 1) {
        _setState1();
      } else if (_tapCount == 2) {
        _setState2();
      } else if (_tapCount == 3) {
        _setState3();
        _reset();
      }
    });
  }

  void _reset() {
    _tapCount = 0;
  }

  void _setState3() {
    _width = 80.0;
    _height = 80.0;
    _color = Colors.green[400];
    _borderRadius = 50.0;
  }

  void _setState2() {
    _width = 50.0;
    _height = 50.0;
    _borderRadius = 0.0;
    _color = Colors.blue[400];
  }

  void _setState1() {
    _width = 150.0;
    _height = 150.0;
    _borderRadius = 20.0;
    _color = Colors.pink[400];
  }
}
