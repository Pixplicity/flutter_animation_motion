import 'package:flutter/material.dart';

///
/// Animating Container's background color from one color to another using a ColorTween.
///
class SimpleColorTweenExample extends StatefulWidget {
  @override
  _SimpleColorTweenExampleState createState() =>
      _SimpleColorTweenExampleState();
}

class _SimpleColorTweenExampleState extends State<SimpleColorTweenExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _animation = ColorTween(
      begin: Colors.blue[400],
      end: Colors.pink[400],
    ).animate(_controller)
      ..addListener(() => setState(() {}));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _animation.value,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
