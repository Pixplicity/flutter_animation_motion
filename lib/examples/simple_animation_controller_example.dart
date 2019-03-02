import 'package:flutter/material.dart';

///
/// Displaying controller's animated value on screen.
/// Simple example of AnimationController usage.
///
class SimpleAnimationControllerExample extends StatefulWidget {
  @override
  _SimpleAnimationControllerExampleState createState() =>
      _SimpleAnimationControllerExampleState();
}

class _SimpleAnimationControllerExampleState
    extends State<SimpleAnimationControllerExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addListener(() {
            setState(() {
              // the animation object’s value has changed
            });
          });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      (_controller.value).toString(),
      style: Theme.of(context).textTheme.title,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
